


with base as (
select
string_split(record_created_at_1,' ')   as splits,
*,
from 
{{ ref('int_bluesky_events') }}
where is_feed_post = 1
and 
  (lower(record_created_at_1) like '%engineering%'
-- or lower(record_created_at_1) like '%the%'
  )
  )
  
Select 
  splits_full.splits as word,
  sum(1) as word_counts
from base
 cross join unnest(splits)   splits_full(splits)
group by 1
order by 2 desc