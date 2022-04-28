

    select *

        {% if target.name == 'qa' %}
        from {{ source('tpch_qa', 'order_items') }}
        {% else %}
        from {{ source('tpch', 'orders') }}
        {% endif %}


-- How to use different sources depending on the environment
-- https://discourse.getdbt.com/t/how-do-i-specify-a-different-schema-for-my-source-at-run-time/561/2