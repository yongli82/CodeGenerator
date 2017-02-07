### {{ table_name }}

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
{% for column in columns -%}
| {{ column.name }} | {{ column.type }} | {{ column.default or '&nbsp;' }} | {{ column.nullable or '&nbsp;' }} | {{ column.comment or '&nbsp;' }} |
{% endfor %}

