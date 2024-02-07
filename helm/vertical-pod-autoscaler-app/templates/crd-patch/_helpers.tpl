{{/* vim: set filetype=mustache: */}}
{{/*
Create a default fully qualified app name.
*/}}
{{- define "vertical-pod-autoscaler.crdPatch.fullname" -}}
{{- printf "%s-%s" (include "vertical-pod-autoscaler.fullname" .) "crd-patch" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Component labels
*/}}
{{- define "vertical-pod-autoscaler.crdPatch.componentLabels" -}}
app.kubernetes.io/component: crd-patch
{{- end -}}

{{/*
Common labels
*/}}
{{- define "vertical-pod-autoscaler.crdPatch.labels" -}}
{{ include "vertical-pod-autoscaler.labels" . }}
{{ include "vertical-pod-autoscaler.crdPatch.componentLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "vertical-pod-autoscaler.crdPatch.selectorLabels" -}}
{{ include "vertical-pod-autoscaler.selectorLabels" . }}
{{ include "vertical-pod-autoscaler.crdPatch.componentLabels" . }}
{{- end -}}
