--
-- Bluesky Raw Seed input
--

with

bluesky_source as (

    select 
    *
    -- from {{ source('bluesky','seed_bluesky_raw') }}
    from 
        (select 1 as test)

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
