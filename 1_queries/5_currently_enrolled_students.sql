select
    name,
    id,
    cohort_id
from
    students
where
    end_date IS NULL
order by
    cohort_id