SELECT
    cohorts.name as cohort,
    TO_CHAR(
        SUM(EXTRACT(EPOCH FROM (assistance_requests.completed_at - assistance_requests.started_at))) * INTERVAL '1 second',
        'HH24:MI:SS'
    ) as total_duration
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
    cohort
ORDER BY total_duration;