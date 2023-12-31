SELECT
    students.name,
    COUNT(assistance_requests.id) as total_assistances
FROM
    assistance_requests
    JOIN students ON students.id = assistance_requests.student_id
WHERE
    students.name = 'Elliot Dickinson'
GROUP BY
    students.name;