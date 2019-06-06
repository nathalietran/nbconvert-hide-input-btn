{%- extends 'slides_reveal.tpl' -%}

{% block input -%}
{{ super() }}
<input class="hidebtn" type="checkbox" id="cell-{{ cell.execution_count}}" data-id="code-{ cell.execution_count }}">
<label title="Toggle cell" for="cell-{{ cell.execution_count}}" class="hideme">
  <span class="hide"></span>
  <span class="view"></span>
</label>
{% endblock input %}
