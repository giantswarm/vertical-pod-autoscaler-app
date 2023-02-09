{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vertical-pod-autoscaler.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.vertical-pod-autoscaler.nameOverride | trimSuffix "-app" }}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "vertical-pod-autoscaler?labels" -}}
application.giantswarm.io/team: {{ index .Chart.Annotations "application.giantswarm.io/team" | default "atlas" | quote }}
{{ include "vertical-pod-autoscaler?selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
giantswarm.io/service-type: "managed"
helm.sh/chart: {{ include "vertical-pod-autoscaler?chart" . }}
{{- if .Values.vertical-pod-autoscaler.podLabels }}
{{ toYaml .Values.vertical-pod-autoscaler.podLabels }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vertical-pod-autoscaler?serviceAccountName" -}}
{{- if .Values.vertical-pod-autoscaler.serviceAccount.create }}
{{- default (include "vertical-pod-autoscaler?fullname" .) .Values.vertical-pod-autoscaler.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.vertical-pod-autoscaler.serviceAccount.name }}
{{- end }}
{{- end }}