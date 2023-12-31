SELECT
    cohorts.name AS cohort_name,
    COUNT(students.id) AS total_students
FROM
    cohorts
INNER JOIN students ON students.cohort_id = cohorts.id
GROUP BY
    cohorts.name
HAVING
    COUNT(students.id) >= 18
ORDER BY
    total_students;