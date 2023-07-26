SELECT
    assignments.id,
    assignments.name as name,
    assignments.day,
    assignments.chapter,
    COUNT(assistance_requests.id) as total_requests
FROM
    assignments
LEFT JOIN
    assistance_requests ON assignments.id = assistance_requests.assignment_id
GROUP BY
    assignments.id,   
    assignments.name,
    assignments.day,
    assignments.chapter
ORDER BY
    total_requests DESC;
