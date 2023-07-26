SELECT
    TO_CHAR(
        AVG(EXTRACT(EPOCH FROM (assistance_requests.started_at - assistance_requests.created_at))) * INTERVAL '1 second',
        'HH24:MI:SS.US'
    ) as average_assistance_wait_time
FROM
    assistance_requests
WHERE
    assistance_requests.started_at IS NOT NULL
    AND assistance_requests.created_at IS NOT NULL;