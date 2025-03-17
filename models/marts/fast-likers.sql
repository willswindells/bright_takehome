{{
    config(
        materialized='incremental',

    )
}}
--Put here to build and export with dbt build
select
concat(cast(strftime('%Y-%m-%d %H:%M', created_at) as string),':00') AS time,
repo as user_id,
sum(is_feed_like) as likes
from 
{{ ref('int_bluesky_events') }}
group by 1,2
having likes > 50