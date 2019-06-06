# nbconvert hide code button
[Jupyter Book](https://jupyter.org/jupyter-book/)-inspired nbconvert template to add toggle button to hide / display code cells. See subsection _Hiding code blocks or entire cells_.

To use the template, run:
```
jupyter nbconvert notebook_to_convert.ipynb --to slides [OPTIONS] --template=hide_cell.tpl
```

The code cells tagged `hidecode` will be hidden. A toggle button will appear on the right to display / hide the given code cell.

Note: only _run_ code cells will be hidden. If you want to remove this behaviour, you will have to remove the condition `cell.execution_count is not none`.
