{{/*
Expand the name of the chart.
*/}}
{{- define "vpa.name" -}}
{{- default .Chart.Name .Values.vertical-pod-autoscaler.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vpa.fullname" -}}
{{- if .Values.vertical-pod-autoscaler.fullnameOverride }}
{{- .Values.vertical-pod-autoscaler.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.vertical-pod-autoscaler.nameOverride | trimSuffix "-app" }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vpa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "vpa.labels" -}}
application.giantswarm.io/team: {{ index .Chart.Annotations "application.giantswarm.io/team" | default "atlas" | quote }}
{{ include "vpa.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
giantswarm.io/service-type: "managed"
helm.sh/chart: {{ include "vpa.chart" . }}
{{- if .Values.vertical-pod-autoscaler.podLabels }}
{{ toYaml .Values.vertical-pod-autoscaler.podLabels }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vpa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vpa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vpa.serviceAccountName" -}}
{{- if .Values.vertical-pod-autoscaler.serviceAccount.create }}
{{- default (include "vpa.fullname" .) .Values.vertical-pod-autoscaler.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.vertical-pod-autoscaler.serviceAccount.name }}
{{- end }}
{{- end }}