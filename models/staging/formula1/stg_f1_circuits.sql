with
    source as (select * from {{ source('formula1', 'circuits') }}),
    
    renamed as (
        select
            circuit_id as circuit_id,
            circuit_ref as circuit_ref,
            name as circuit_name,
            location as location,
            country as country,
            lat as latitude,
            lng as longitude,
            to_number(iff(contains(alt, 'N'), null, alt)) as altitude,
            url as circuit_url
        from source
    )
select *
from renamed
