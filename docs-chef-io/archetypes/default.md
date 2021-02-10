+++
title = "{{ or (replace .Name "_" " ") (replace .Name "-" " ")  | title }}"
draft = false
gh_repo = "inspec"

[menu]
  [menu.desktop]
    title = "{{ replace .Name "-" " " | title }}"
    identifier = "inspec/{{ .Name }}.md {{ or (replace .Name "_" " ") (replace .Name "-" " ") | title }}"
    parent = "inspec"
    weight = 10
+++
