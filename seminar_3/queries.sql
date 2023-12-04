--Query 1
DEALLOCATE lessons_per_year;

PREPARE lessons_per_year AS
SELECT
  EXTRACT(YEAR FROM date) AS Year,
  TO_CHAR(date, 'Mon') AS Month,
  COUNT(*) AS Total,
  COUNT(*) FILTER (WHERE lesson_type = 'Individual') AS Individual,
  COUNT(*) FILTER (WHERE lesson_type = 'Group') AS Group,
  COUNT(*) FILTER (WHERE lesson_type = 'Ensemble') AS Ensemble
FROM lesson
WHERE EXTRACT(YEAR FROM date) = $1
GROUP BY EXTRACT(YEAR FROM date), TO_CHAR(date, 'Mon')
ORDER BY EXTRACT(YEAR FROM date), MIN(date);

EXECUTE lessons_per_year('2023');



--Query 2
SELECT 
    No_of_Siblings, 
    COUNT(*) as Count
FROM (
    SELECT 
        s.id, 
        COUNT(sr.student_id) as No_of_Siblings
    FROM 
        student s
        LEFT JOIN sibling_relations sr ON s.id = sr.student_id
    GROUP BY 
        s.id
) as StudentSiblings
GROUP BY 
    No_of_Siblings
ORDER BY No_of_Siblings ASC;



--Query 3
DEALLOCATE min_lessons_by_instructor;

PREPARE min_lessons_by_instructor AS
SELECT
  i.id, p.first_name, p.last_name, COUNT(*) as No_of_Lessons
FROM instructor i
JOIN person p ON i.person_id = p.id
JOIN lesson l ON i.id = l.instructor_id
WHERE l.date >= date_trunc('month', CURRENT_DATE) -- Start of current month
  AND l.date < (date_trunc('month', CURRENT_DATE) + interval '1 month') -- End of current month
GROUP BY i.id, p.first_name, p.last_name
HAVING COUNT(*) > $1
ORDER BY No_of_Lessons DESC;

EXECUTE min_lessons_by_instructor('3');


--Query 4
SELECT 
    TO_CHAR(date, 'Day') AS Day, 
    e.genre, 
    CASE 
      WHEN e.max_attendees - e.attendees <= 0 THEN 'No Seats'
      WHEN e.max_attendees - e.attendees BETWEEN 1 AND 2 THEN '1 or 2 Seats'
      ELSE 'Many Seats'
  END AS "No of free Seats"
FROM lesson l JOIN ensemble e ON e.lesson_id = l.id
WHERE
    l.lesson_type = 'Ensemble' AND
     l.date >= CURRENT_DATE AND l.date < CURRENT_DATE + INTERVAL '7 days'
ORDER BY
  CASE 
    WHEN EXTRACT(DOW FROM l.date) = 0 THEN 7
    ELSE EXTRACT(DOW FROM l.date)
  END,
  e.genre;

