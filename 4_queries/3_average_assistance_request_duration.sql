SELECT
    TO_CHAR(
        (SUM(EXTRACT(EPOCH FROM (completed_at - started_at))) / COUNT(*)) * INTERVAL '1 second',
        'HH24:MI:SS.US'
    ) as average_duration
FROM
    assistance_requests
WHERE
    completed_at IS NOT NULL
    AND started_at IS NOT NULL;
