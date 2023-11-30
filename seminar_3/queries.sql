--Works
CREATE VIEW lesson_count_month AS
SELECT
  --EXTRACT(YEAR FROM date) AS Year, -- Extracts the year from the date
  TO_CHAR(date, 'Month') AS Month, -- Formats the date to return the full month name
  COUNT(*) AS Total,
  COUNT(*) AS Total,
  COUNT(CASE WHEN lesson_type = 'Individual' THEN 1 END) AS Individual,
  COUNT(CASE WHEN lesson_type = 'Group' THEN 1 END) AS Group,
  COUNT(CASE WHEN lesson_type = 'Ensemble' THEN 1 END) AS Ensemble
FROM  lesson
WHERE  EXTRACT(YEAR FROM date) = 2022
GROUP BY   
  --EXTRACT(YEAR FROM date), -- Group by year as well for completeness
  TO_CHAR(date, 'Month'),
  EXTRACT(MONTH FROM date) -- Extracting the month number for ordering purposes
ORDER BY  Month;



--Works
CREATE VIEW siblings_and_student AS
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


--Works
CREATE VIEW lesson_count_type_month AS
SELECT
i.id, p.first_name, p.last_name, COUNT(*) as No_of_Lessons
from instructor i
JOIN person p ON i.person_id = p.id
JOIN lesson l ON i.id = l.instructor_id
WHERE l.date >= date_trunc('month', CURRENT_DATE) -- Start of current month
  AND l.date < (date_trunc('month', CURRENT_DATE) + interval '1 month') -- End of current month
GROUP BY i.id, p.first_name, p.last_name
ORDER BY No_of_Lessons DESC

--Works with both choice one
--CREATE VIEW lesson_count_type_month AS
CREATE MATERIALIZED View lesson_next_week AS
SELECT
    --EXTRACT(YEAR FROM l.date) AS Year, -- Extracts the year from the date
    TO_CHAR(l.date, 'Day') AS Day, -- Gets the day name from the date
    e.genre,
    CASE 
        WHEN e.max_attendees - e.attendees <= 0 THEN 'No Seats'
        WHEN e.max_attendees - e.attendees BETWEEN 1 AND 2 THEN '1 or 2 Seats'
        ELSE 'Many Seats'
    END AS "No of Free Seats"
FROM
    lesson l
JOIN
    ensemble e ON l.id = e.lesson_id
WHERE
    l.lesson_type = 'Ensemble' AND
    EXTRACT(YEAR FROM l.date) = 2023
ORDER BY
    e.genre,
    TO_CHAR(l.date, 'Day'); -- Sorts by genre and then by the weekday
