--Query 1
--If the query is prepared previously, it has to be deallocated
DEALLOCATE lessons_per_year;

--Preparation
PREPARE lessons_per_year (int) AS
SELECT
  $1 AS "Year",
  TO_CHAR(date, 'Mon') AS "Month",
  COUNT(*) AS "Total",
  COUNT(*) FILTER (WHERE lesson_type = 'Individual') AS "Individual",
  COUNT(*) FILTER (WHERE lesson_type = 'Group') AS "Group",
  COUNT(*) FILTER (WHERE lesson_type = 'Ensemble') AS "Ensemble"
FROM lesson
WHERE EXTRACT(YEAR FROM date) = $1
GROUP BY "Month"
ORDER BY MIN(date);

--Execution
EXECUTE lessons_per_year(2023);



--Query 2
--Deletes the view if it exists
DROP VIEW IF EXISTS no_of_siblings;

--Create a view that can be executed at a later stage
CREATE VIEW no_of_siblings AS
SELECT 
    No_of_Siblings as "No of Siblings",
    COUNT(*) as "Count"
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

--Execute the view
  SELECT * FROM no_of_siblings;



--Query 3
--Same as with query 1, if the query is previously preprated, it has to be deallocated
DEALLOCATE min_lessons_by_instructor;

--Preparation
PREPARE min_lessons_by_instructor (int) AS
SELECT
  i.id as "ID",
  p.first_name as "First Name",
  p.last_name as "Last Name",
  COUNT(*) as "No of Lessons"
FROM instructor i
JOIN person p ON i.person_id = p.id
JOIN lesson l ON i.id = l.instructor_id
WHERE l.date >= date_trunc('month', CURRENT_DATE) -- Start of current month
  AND l.date < (date_trunc('month', CURRENT_DATE) + interval '1 month') -- End of current month
GROUP BY i.id, p.first_name, p.last_name
HAVING COUNT(*) > $1
ORDER BY "No of Lessons" DESC;

--Execution
EXECUTE min_lessons_by_instructor(5);



--Query 4
--Deletes the view if it exists
DROP VIEW IF EXISTS lessons_next_week;

--Create a view that can be executed at a later stage
CREATE VIEW lessons_next_week AS
SELECT
    TO_CHAR(date, 'Day') AS "Day",
    e.genre AS "Genre",
    CASE 
      WHEN e.max_attendees - e.attendees <= 0 THEN 'No Seats'
      WHEN e.max_attendees - e.attendees BETWEEN 1 AND 2 THEN '1 or 2 Seats'
      ELSE 'Many Seats'
  END AS "No of Free Seats"
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

--Execute the view
  SELECT * FROM lessons_next_week;


--Explain analyze function
  EXPLAIN ANALYZE
  SELECT * FROM lesson_next_week;