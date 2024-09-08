{{/* vim: set filetype=mustache: */}}

{{/*
Component labels
*/}}
{{- define "vertical-pod-autoscaler.recommender-observability.componentLabels" -}}
app.kubernetes.io/component: recommender-observability
{{- end -}}

{{/*
Common labels
*/}}
{{- define "vertical-pod-autoscaler.recommender-observability.labels" -}}
{{ include "vertical-pod-autoscaler.labels" . }}
{{ include "vertical-pod-autoscaler.recommender-observability.componentLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "vertical-pod-autoscaler.recommender-observability.selectorLabels" -}}
{{ include "vertical-pod-autoscaler.selectorLabels" . }}
{{ include "vertical-pod-autoscaler.recommender-observability.componentLabels" . }}
{{- end -}}
