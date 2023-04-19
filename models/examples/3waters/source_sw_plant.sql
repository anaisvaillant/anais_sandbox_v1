
{% set cols = adapter.get_columns_in_relation(ref('stg_sw_plant')) %}

--select 
--{% for col in cols %}  -- if column values in stg_sw_plant = column_name in replace column_A
--  {% if col.name.endswith('_ID') %}
--    {{ col.name }} as {{ col.name[:-3] -}}
--  {% else %} -- else keep column_A
--    {{ col.name -}}
--  {% endif %}
--  {%- if not loop.last %}, {% endif %}
--{% endfor %}

--from {{ ref('stg_sw_plant') }}