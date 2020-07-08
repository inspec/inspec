+++
title = "{{ or (replace .Name "_" " ") (replace .Name "-" " ")  | title }}"
draft = false

[menu]
  [menu.desktop]
    title = "{{ replace .Name "-" " " | title }}"
    identifier = "inspec/{{ .Name }}.md {{ or (replace .Name "_" " ") (replace .Name "-" " ") | title }}"
    parent = "inspec"
    weight = 10
+++

[\[edit on GitHub\]](https://github.com/inspec/inspec/blob/master/docs/content/inspec/{{ .Name }}.md)
