{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "vertical-pod-autoscaler.name" -}}
{{- $default := "vertical-pod-autoscaler-app" -}}
{{- $vpaValues := index .Values "vertical-pod-autoscaler" -}}
{{- coalesce $vpaValues.nameOverride .Values.nameOverride $default | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vertical-pod-autoscaler.fullname" -}}
{{- $vpaValues := index .Values "vertical-pod-autoscaler" -}}
{{- if or ($vpaValues.fullnameOverride) (.Values.fullnameOverride) -}}
{{- coalesce $vpaValues.fullnameOverride .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride $vpaValues.nameOverride | trimSuffix "-app" -}}
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
{{- define "vertical-pod-autoscaler.labels" -}}
application.giantswarm.io/team: {{ index .Chart.Annotations "application.giantswarm.io/team" | default "atlas" | quote }}
{{ include "vertical-pod-autoscaler.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
giantswarm.io/service-type: "managed"
helm.sh/chart: {{ include "vertical-pod-autoscaler.chart" . }}
{{- end -}}
