{{/*
Expand the name of the chart.
*/}}
{{- define "op-batcher.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "op-batcher.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
secret vault name
*/}}
{{- define "op-batcher.secretname" -}}
{{ include "op-batcher.fullname" . }}-secret
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "op-batcher.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "op-batcher.labels" -}}
helm.sh/chart: {{ include "op-batcher.chart" . }}
{{ include "op-batcher.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "op-batcher.selectorLabels" -}}
app.kubernetes.io/name: {{ include "op-batcher.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

