# vertical-pod-autoscaler-app

![Version: 5.0.0](https://img.shields.io/badge/Version-5.0.0-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A Helm chart for the Vertical Pod Autoscaler.

**Homepage:** <https://github.com/giantswarm/vertical-pod-autoscaler-app>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://cowboysysop.github.io/charts | vertical-pod-autoscaler | 9.6.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ciliumNetworkPolicy.enabled | bool | `true` |  |
| global.imageRegistry | string | `"gsoci.azurecr.io"` |  |
| vertical-pod-autoscaler.admissionController.enabled | bool | `true` |  |
| vertical-pod-autoscaler.admissionController.extraArgs.kube-api-burst | int | `75` |  |
| vertical-pod-autoscaler.admissionController.extraArgs.kube-api-qps | int | `50` |  |
| vertical-pod-autoscaler.admissionController.extraArgs.v | int | `2` |  |
| vertical-pod-autoscaler.admissionController.extraArgs.webhook-timeout-seconds | int | `5` |  |
| vertical-pod-autoscaler.admissionController.image.pullPolicy | string | `"IfNotPresent"` |  |
| vertical-pod-autoscaler.admissionController.image.registry | string | `"gsoci.azurecr.io"` |  |
| vertical-pod-autoscaler.admissionController.image.repository | string | `"giantswarm/vpa-admission-controller"` |  |
| vertical-pod-autoscaler.admissionController.image.tag | string | `"1.0.0"` |  |
| vertical-pod-autoscaler.admissionController.metrics.serviceMonitor.enabled | bool | `true` |  |
| vertical-pod-autoscaler.admissionController.pdb.create | bool | `true` |  |
| vertical-pod-autoscaler.admissionController.podSecurityContext.runAsNonRoot | bool | `true` |  |
| vertical-pod-autoscaler.admissionController.podSecurityContext.runAsUser | int | `65534` |  |
| vertical-pod-autoscaler.admissionController.podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| vertical-pod-autoscaler.admissionController.replicaCount | int | `2` |  |
| vertical-pod-autoscaler.admissionController.resources.limits.cpu | string | `"500m"` |  |
| vertical-pod-autoscaler.admissionController.resources.requests.cpu | string | `"250m"` |  |
| vertical-pod-autoscaler.admissionController.resources.requests.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.admissionController.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| vertical-pod-autoscaler.admissionController.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| vertical-pod-autoscaler.admissionController.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.containerPolicies.controlledResources[0] | string | `"cpu"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.containerPolicies.controlledResources[1] | string | `"memory"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.containerPolicies.minAllowed.cpu | string | `"200m"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.containerPolicies.minAllowed.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.containerPolicies.mode | string | `"Auto"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.enabled | bool | `false` |  |
| vertical-pod-autoscaler.crds.image.registry | string | `"gsoci.azurecr.io"` |  |
| vertical-pod-autoscaler.crds.image.repository | string | `"giantswarm/kubectl"` |  |
| vertical-pod-autoscaler.crds.image.tag | string | `"1.29.1"` |  |
| vertical-pod-autoscaler.fullnameOverride | string | `""` |  |
| vertical-pod-autoscaler.nameOverride | string | `""` |  |
| vertical-pod-autoscaler.recommender.extraArgs.kube-api-burst | int | `75` |  |
| vertical-pod-autoscaler.recommender.extraArgs.kube-api-qps | int | `50` |  |
| vertical-pod-autoscaler.recommender.extraArgs.memory-saver | bool | `true` |  |
| vertical-pod-autoscaler.recommender.extraArgs.oom-bump-up-ratio | float | `2` |  |
| vertical-pod-autoscaler.recommender.extraArgs.pod-recommendation-min-cpu-millicores | int | `50` |  |
| vertical-pod-autoscaler.recommender.extraArgs.pod-recommendation-min-memory-mb | int | `250` |  |
| vertical-pod-autoscaler.recommender.extraArgs.target-cpu-percentile | float | `0.95` |  |
| vertical-pod-autoscaler.recommender.extraArgs.v | int | `2` |  |
| vertical-pod-autoscaler.recommender.image.pullPolicy | string | `"IfNotPresent"` |  |
| vertical-pod-autoscaler.recommender.image.registry | string | `"gsoci.azurecr.io"` |  |
| vertical-pod-autoscaler.recommender.image.repository | string | `"giantswarm/vpa-recommender"` |  |
| vertical-pod-autoscaler.recommender.image.tag | string | `"1.0.0"` |  |
| vertical-pod-autoscaler.recommender.livenessProbe.failureThreshold | int | `5` |  |
| vertical-pod-autoscaler.recommender.livenessProbe.initialDelaySeconds | int | `45` |  |
| vertical-pod-autoscaler.recommender.livenessProbe.periodSeconds | int | `15` |  |
| vertical-pod-autoscaler.recommender.metrics.serviceMonitor.enabled | bool | `true` |  |
| vertical-pod-autoscaler.recommender.pdb.create | bool | `false` |  |
| vertical-pod-autoscaler.recommender.podAnnotations."cluster-autoscaler.kubernetes.io/safe-to-evict" | string | `"true"` |  |
| vertical-pod-autoscaler.recommender.podSecurityContext.runAsNonRoot | bool | `true` |  |
| vertical-pod-autoscaler.recommender.podSecurityContext.runAsUser | int | `65534` |  |
| vertical-pod-autoscaler.recommender.podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| vertical-pod-autoscaler.recommender.readinessProbe.failureThreshold | int | `5` |  |
| vertical-pod-autoscaler.recommender.readinessProbe.initialDelaySeconds | int | `30` |  |
| vertical-pod-autoscaler.recommender.readinessProbe.periodSeconds | int | `15` |  |
| vertical-pod-autoscaler.recommender.replicaCount | int | `1` |  |
| vertical-pod-autoscaler.recommender.resources.requests.cpu | string | `"500m"` |  |
| vertical-pod-autoscaler.recommender.resources.requests.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.recommender.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| vertical-pod-autoscaler.recommender.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| vertical-pod-autoscaler.recommender.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.containerPolicies.controlledResources[0] | string | `"cpu"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.containerPolicies.controlledResources[1] | string | `"memory"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.containerPolicies.minAllowed.cpu | string | `"250m"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.containerPolicies.minAllowed.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.containerPolicies.mode | string | `"Auto"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.enabled | bool | `false` |  |
| vertical-pod-autoscaler.updater.enabled | bool | `true` |  |
| vertical-pod-autoscaler.updater.extraArgs.kube-api-burst | int | `75` |  |
| vertical-pod-autoscaler.updater.extraArgs.kube-api-qps | int | `50` |  |
| vertical-pod-autoscaler.updater.extraArgs.min-replicas | int | `1` |  |
| vertical-pod-autoscaler.updater.extraArgs.v | int | `2` |  |
| vertical-pod-autoscaler.updater.image.pullPolicy | string | `"IfNotPresent"` |  |
| vertical-pod-autoscaler.updater.image.registry | string | `"gsoci.azurecr.io"` |  |
| vertical-pod-autoscaler.updater.image.repository | string | `"giantswarm/vpa-updater"` |  |
| vertical-pod-autoscaler.updater.image.tag | string | `"1.0.0"` |  |
| vertical-pod-autoscaler.updater.livenessProbe.failureThreshold | int | `5` |  |
| vertical-pod-autoscaler.updater.livenessProbe.initialDelaySeconds | int | `45` |  |
| vertical-pod-autoscaler.updater.livenessProbe.periodSeconds | int | `15` |  |
| vertical-pod-autoscaler.updater.metrics.serviceMonitor.enabled | bool | `true` |  |
| vertical-pod-autoscaler.updater.pdb.create | bool | `false` |  |
| vertical-pod-autoscaler.updater.podAnnotations."cluster-autoscaler.kubernetes.io/safe-to-evict" | string | `"true"` |  |
| vertical-pod-autoscaler.updater.podSecurityContext.runAsNonRoot | bool | `true` |  |
| vertical-pod-autoscaler.updater.podSecurityContext.runAsUser | int | `65534` |  |
| vertical-pod-autoscaler.updater.podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| vertical-pod-autoscaler.updater.readinessProbe.failureThreshold | int | `5` |  |
| vertical-pod-autoscaler.updater.readinessProbe.initialDelaySeconds | int | `30` |  |
| vertical-pod-autoscaler.updater.readinessProbe.periodSeconds | int | `15` |  |
| vertical-pod-autoscaler.updater.replicaCount | int | `1` |  |
| vertical-pod-autoscaler.updater.resources.requests.cpu | string | `"500m"` |  |
| vertical-pod-autoscaler.updater.resources.requests.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.updater.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| vertical-pod-autoscaler.updater.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| vertical-pod-autoscaler.updater.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.containerPolicies.controlledResources[0] | string | `"cpu"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.containerPolicies.controlledResources[1] | string | `"memory"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.containerPolicies.minAllowed.cpu | string | `"250m"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.containerPolicies.minAllowed.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.containerPolicies.mode | string | `"Auto"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.enabled | bool | `false` |  |
