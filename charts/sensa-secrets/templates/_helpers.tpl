{{/*
Validate that the password meets our criteria - minimum of 12 alpha-numeric characters
*/}}
{{- define "validPass" -}}
{{ $error := "PASSWORD must contain only alpha-numeric characters and be at least 12 characters long.  Please update the PASSWORD in global-values.yaml." }}
{{ $pass := .Values.global.PASSWORD }}
{{- if eq ( regexMatch "^[A-Za-z0-9]{12,}$" $pass ) false }}
{{ fail ( $error ) }}
{{- end }}
{{- end }}
