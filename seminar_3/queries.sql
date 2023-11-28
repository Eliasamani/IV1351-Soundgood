PREPARE lessons_per_year AS
SELECT
  TO_CHAR(date, 'Mon') AS Month,
  COUNT(*) FILTER (WHERE EXTRACT(YEAR FROM date) = $1) AS Total,
  COUNT(*) FILTER (WHERE lesson_type = 'individual' AND EXTRACT(YEAR FROM date) = $1) AS Individual,
  COUNT(*) FILTER (WHERE lesson_type = 'group' AND EXTRACT(YEAR FROM date) = $1) AS Group,
  COUNT(*) FILTER (WHERE lesson_type = 'ensemble' AND EXTRACT(YEAR FROM date) = $1) AS Ensemble
FROM lesson
GROUP BY EXTRACT(YEAR FROM date), TO_CHAR(date, 'Mon')
ORDER BY EXTRACT(YEAR FROM date), MIN(date);






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






SELECT
i.id, p.first_name, p.last_name, COUNT(*) as No_of_Lessons
from instructor i
JOIN person p ON i.person_id = p.id
JOIN lesson l ON i.id = l.instructor_id
WHERE l.date >= date_trunc('month', CURRENT_DATE) -- Start of current month
  AND l.date < (date_trunc('month', CURRENT_DATE) + interval '1 month') -- End of current month
GROUP BY i.id, p.first_name, p.last_name
ORDER BY No_of_Lessons DESC