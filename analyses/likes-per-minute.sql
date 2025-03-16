

select
    concat(cast(strftime('%Y-%m-%d %H:%M', created_at) as string),':00') AS time,
    sum(is_feed_like) as likes
from 
{{ ref('int_bluesky_events') }}
group by 1