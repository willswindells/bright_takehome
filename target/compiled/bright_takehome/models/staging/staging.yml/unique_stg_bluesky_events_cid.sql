
    
    

select
    cid as unique_field,
    count(*) as n_records

from "bluesky"."main"."stg_bluesky_events"
where cid is not null
group by cid
having count(*) > 1


