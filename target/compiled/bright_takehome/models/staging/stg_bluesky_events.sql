--
-- Bluesky Raw Seed input
--

with

bluesky_source as (

    select 
    *
    from "bluesky"."main"."seed_bluesky_raw"

),

bluesky_data as 
(
select 
cid,
action as event_action,
cast(timestamp as timestamp) as created_at,
repo,
record,
py_type,
prev,
path as full_path,
from 
bluesky_source
)

select * 
from bluesky_data