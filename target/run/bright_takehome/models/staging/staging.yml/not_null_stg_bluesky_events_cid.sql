select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select cid
from "bluesky"."main"."stg_bluesky_events"
where cid is null



      
    ) dbt_internal_test