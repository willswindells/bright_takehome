--
-- Bluesky nested Json process
--

with

base as (

    select 
    *
    from "bluesky"."main"."stg_bluesky_events"

)

,bluesky_int_extracted as 
(
select 
*,
record."$type" as record_type,
record."subject" as record_subject,
record."createdAt" as record_created_at,
record."text" as record_created_at,
-- record."" as ``
-- record."" as ``
-- record."" as ``
from 
base
)

,bluesky_int_processed as
(
    Select 
    * ,
    
    --Int flags not bool for summing speed, take hit on storage
    case when left(full_path,18) = 'app.bsky.feed.like' then 1 else 0 end as is_feed_like,
    case when left(full_path,20) = 'app.bsky.feed.repost' then 1 else 0 end as is_feed_repost,
    case when left(full_path,21) = 'app.bsky.graph.follow' then 1 else 0 end as is_feed_follow,
    case when left(full_path,18) = 'app.bsky.feed.post' then 1 else 0 end as is_feed_post,

    from
        bluesky_int_extracted
)
  
select 
*
from bluesky_int_processed