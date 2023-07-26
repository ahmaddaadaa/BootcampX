SELECT
    cohorts.name,
    TO_CHAR(
        '00:00:00'::interval + (AVG(EXTRACT(EPOCH FROM (assistance_requests.completed_at - assistance_requests.started_at))) || ' seconds')::interval,
        'HH24:MI:SS.US'
    ) as average_assistance_time
FROM
    cohorts
LEFT JOIN
    students ON students.cohort_id = cohorts.id
LEFT JOIN
    assistance_requests ON assistance_requests.student_id = students.id
WHERE
    assistance_requests.completed_at IS NOT NULL
    AND assistance_requests.started_at IS NOT NULL
GROUP BY
    cohorts.name
ORDER BY average_assistance_time;
