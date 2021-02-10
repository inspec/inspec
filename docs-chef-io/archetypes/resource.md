+++
title = "{{ or (replace .Name "_" " ") (replace .Name "-" " ")  | title }}"
draft = false
platform = "<platform>"
gh_repo = "inspec"

[menu]
  [menu.desktop]
    title = "{{ replace .Name "-" " " | title }}"
    identifier = "inspec/resources/{{ .Name }}.md {{ or (replace .Name "_" " ") (replace .Name "-" " ") | title }}"
    parent = "inspec/resources"
+++
