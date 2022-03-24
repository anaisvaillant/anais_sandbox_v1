with source as (

    select *

        {% if target.name == 'qa' %}
        from {{ source('tpch_qa', 'orders') }}
        {% else %}
        from {{ source('tpch', 'orders') }}
        {% endif %}

),

renamed as (

    select
    
        o_orderkey as order_key,
        o_custkey as customer_key,
        o_orderstatus as status_code,
        o_totalprice as total_price,
        o_orderdate as order_date,
        o_orderpriority as priority_code,
        o_clerk as clerk_name,
        o_shippriority as ship_priority,
        o_comment as comment

    from source

)

select * from renamed

-- How to use different sources depending on the environment
-- https://discourse.getdbt.com/t/how-do-i-specify-a-different-schema-for-my-source-at-run-time/561/2