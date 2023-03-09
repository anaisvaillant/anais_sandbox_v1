with orders as (
    
    select * from {{ ref('stg_tpch_orders') }}

),

line_item as (

    select * from {{ ref('stg_tpch_line_item') }}

)

select *

    from
    orders