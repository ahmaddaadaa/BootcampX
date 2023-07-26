SELECT
    TO_CHAR(
        '00:00:00'::interval + (AVG(total_duration_seconds) || ' seconds')::interval,
        'HH24:MI:SS.US'
    ) as average_total_duration
FROM (
    SELECT
        cohorts.name as cohort,
        SUM(EXTRACT(EPOCH FROM (assistance_requests.completed_at - assistance_requests.started_at))) as total_duration_seconds
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
) as subquery;
