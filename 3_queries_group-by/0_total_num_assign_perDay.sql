select
    count(id),
    day
from
    assignments 
GROUP by
    day
ORDER BY day;