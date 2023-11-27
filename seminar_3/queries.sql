SELECT
  TO_CHAR(date, 'Mon') AS Month,
  COUNT(*) AS Total,
  COUNT(*) FILTER (WHERE lesson_type = 'individual') AS Individual,
  COUNT(*) FILTER (WHERE lesson_type = 'group') AS Group,
  COUNT(*) FILTER (WHERE lesson_type = 'ensemble') AS Ensemble
FROM lesson
GROUP BY EXTRACT(YEAR FROM date), TO_CHAR(date, 'Mon')
ORDER BY EXTRACT(YEAR FROM date), MIN(date);
