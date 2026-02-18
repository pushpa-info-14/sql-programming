select player_id, count(*) as count, min(event_date) as min_date, max(event_date) as max_date
from (
    select 
        *,
        row_number() over (partition by player_id order by event_date) as seq_num
    from Activity
) t
group by player_id, dateadd(day, -seq_num, event_date)
having count(*) > 1
order by player_id, min(event_date);