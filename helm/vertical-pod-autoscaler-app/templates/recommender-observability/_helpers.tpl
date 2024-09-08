{{/* vim: set filetype=mustache: */}}

{{/*
Component labels
*/}}
{{- define "vertical-pod-autoscaler.recommenderObservability.componentLabels" -}}
app.kubernetes.io/component: recommender
{{- end -}}

{{/*
Common labels
*/}}
{{- define "vertical-pod-autoscaler.recommenderObservability.labels" -}}
{{ include "vertical-pod-autoscaler.labels" . }}
{{ include "vertical-pod-autoscaler.recommenderObservability.componentLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "vertical-pod-autoscaler.recommenderObservability.selectorLabels" -}}
{{ include "vertical-pod-autoscaler.selectorLabels" . }}
{{ include "vertical-pod-autoscaler.recommenderObservability.componentLabels" . }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "vertical-pod-autoscaler.recommender.serviceAccountName" -}}
{{- $values := (index .Values "vertical-pod-autoscaler") -}}
{{- if $values.recommender.serviceAccount.create -}}
    {{ default (include "vertical-pod-autoscaler.recommender.fullname" .) $values.recommender.serviceAccount.name }}
{{- else -}}
    {{ default "default" $values.recommender.serviceAccount.name }}
{{- end -}}
{{- end -}}
