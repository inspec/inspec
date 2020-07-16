+++
title = "{{ or (replace .Name "_" " ") (replace .Name "-" " ")  | title }}"
draft = false
platform = "<platform>"

[menu]
  [menu.desktop]
    title = "{{ replace .Name "-" " " | title }}"
    identifier = "inspec/resources/{{ .Name }}.md {{ or (replace .Name "_" " ") (replace .Name "-" " ") | title }}"
    parent = "inspec/resources"
+++

[\[edit on GitHub\]](https://github.com/inspec/inspec/blob/master/docs/content/inspec/resources/{{ .Name }}.md)
