{% macro compare_columns(table1, table2) %}
    {% set columns1 = adapter.get_columns_in_relation(ref(table1)) %}
    {% set columns2 = adapter.get_columns_in_relation(ref(table2)) %}
    {% for column in columns1 %}
        {% if column in columns2 %}
            {{ log("Column: " ~ column.name, info=true) }}
        {% endif %}
    {% endfor %}
{% endmacro %}