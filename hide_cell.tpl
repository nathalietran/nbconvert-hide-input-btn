{%- extends 'slides_reveal.tpl' -%}

{%- block header -%}
{{ super() }}

<style type="text/css">
input[class="hidebtn"] {
    display: none;
}

.hideme {
    display: block;
    position: absolute;
    top: 9px;
    right: -30px;
    padding: .3em;
    width: 20px;
    height: 20px;
    background: #d4d4d4;
    border-radius: 25px;
    transition: .25s;
    -webkit-transition: .25s;
    -moz-transition: .25s;
    -o-transition: .25s;
    -ms-transition: .25s;
}

.hideme:hover {
  background-color: black;
}

.hideme span {
    display: block;
    position: absolute;
    border-radius: 3px;
    background: #f2f2f2;
    transition: all .25s ease;
    -webkit-transition: all .25s ease;
    -moz-transition: all .25s ease;
    -o-transition: all .25s ease;
    -ms-transition: all .25s ease;
    margin: 0% 15%;
    height: 2.5px;
    width: 70%;
    left: 0px;
    bottom: 0px;
    right: 0px;
    top: calc(50% - 2.5px / 2);
}

input:checked ~ .hideme span.view-cell {
    transform: rotate(-90deg);
    -webkit-transform: rotate(-90deg);
    -moz-transform: rotate(-90deg);
    -o-transform: rotate(-90deg);
    -ms-transform: rotate(-90deg);
}
</style>
{%- endblock header -%}

{% block input -%}
{{ super() }}
{% if 'hidecode' in cell['metadata'].get('tags', []) %}
<input class="hidebtn" type="checkbox" checked id="cell-{{ cell.execution_count }}" data-id="code-{{ cell.execution_count }}">
<label title="Toggle cell" for="cell-{{ cell.execution_count }}" class="hideme">
  <span class="hide-cell"></span>
  <span class="view-cell"></span>
</label>
{% endif %}
{% endblock input %}
