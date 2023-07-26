SELECT
    teachers.name as teacher,
    students.name as student,
    assignments.name as assignment,
    TO_CHAR(INTERVAL '1 second' * EXTRACT(EPOCH FROM (assistance_requests.completed_at - assistance_requests.started_at)), 'HH24:MI:SS') as duration
FROM
    students
FULL JOIN
    assistance_requests ON students.id = assistance_requests.student_id
FULL JOIN
    teachers ON teachers.id = assistance_requests.teacher_id
FULL JOIN
    assignments ON assistance_requests.assignment_id = assignments.id
WHERE assistance_requests.teacher_id IS NOT NULL
ORDER BY
    duration;
