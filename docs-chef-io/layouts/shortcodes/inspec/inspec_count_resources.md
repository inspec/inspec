{{/* Counts the number of resource pages from all repositories in content/inspec/resources */}}

{{- $inspecResources := .Site.GetPage "inspec/resources" -}}
{{- len $inspecResources.Pages -}}
