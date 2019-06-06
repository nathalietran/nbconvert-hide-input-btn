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

.codecell {
  width: 100%;
}
</style>

<script type="text/javascript">
  var setCodeCellVisibility = function (inputField, kind) {
      var id = inputField.getAttribute('data-id');
      var codePrompt = document.querySelector(`#${id} div.input div.input_prompt`);
      var codeCell = document.querySelector(`#${id} div.input div.inner_cell`);

      if (kind === "visible") {
          codeCell.classList.remove('hidden');
          codePrompt.classList.remove('hidden');
          inputField.checked = true;
      } else {
          codeCell.classList.add('hidden');
          codePrompt.classList.add('hidden');
          inputField.checked = false;
      }
  }

  var toggleCodeCellVisibility = function (event) {
      // The label is clicked, and now we decide what to do based on the input field's clicked status
      if (event.target.tagName === "LABEL") {
          var inputField = event.target.previousElementSibling;
      } else {
          // It is the span inside the target
          var inputField = event.target.parentElement.previousElementSibling;
      }

      if (inputField.checked === true) {
          setCodeCellVisibility(inputField, "visible");
      } else {
          setCodeCellVisibility(inputField, "hidden");
      }
  }

  var addListener = function () {
      document.querySelectorAll('div.codecell div.input input + label').forEach(function (item, index) {
        item.addEventListener('click', toggleCodeCellVisibility);
      });
  }

  document.addEventListener("DOMContentLoaded", function(event){
    addListener();
});

</script>
{%- endblock header -%}

{% block input_group -%}
<div id="code-{{ cell.execution_count }}" class="codecell">
  {{ super() }}
</div>
{% endblock input_group %}

{% block input -%}
{{ super() }}
{% if 'hidecode' in cell['metadata'].get('tags', []) %}
<input class="hidebtn" type="checkbox" checked id="cell-{{ cell.execution_count }}" data-id="code-{{ cell.execution_count }}">
<label title="Toggle cell" for="cell-{{ cell.execution_count }}" class="hideme">
  <span class="hide-cell"></span>
  <span class="view-cell"></span>
</label>
{% endif %}
{% endblock input -%}
