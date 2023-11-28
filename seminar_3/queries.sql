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