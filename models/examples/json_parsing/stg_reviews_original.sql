-- example of source with json blob
select * from {{ source('reviews', 'json_reviews') }}