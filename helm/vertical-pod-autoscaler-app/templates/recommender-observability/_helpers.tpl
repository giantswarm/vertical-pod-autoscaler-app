{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "vertical-pod-autoscaler.recommenderObservability.fullname" -}}
{{- printf "%s-%s" (include "vertical-pod-autoscaler.fullname" .) "recommender-observability" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified metrics name.
*/}}
{{- define "vertical-pod-autoscaler.recommenderObservability.metrics.fullname" -}}
{{- printf "%s-%s" (include "vertical-pod-autoscaler.recommenderObservability.fullname" .) "metrics-observability" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Component labels
*/}}
{{- define "vertical-pod-autoscaler.recommenderObservability.componentLabels" -}}
app.kubernetes.io/component: recommender-observability
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
