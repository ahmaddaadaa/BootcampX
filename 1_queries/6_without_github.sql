select
    name,
    email,
    phone
from
    students
where
    github IS NULL
    AND end_date is not null