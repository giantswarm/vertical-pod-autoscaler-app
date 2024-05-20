# vertical-pod-autoscaler-app

![Version: 5.2.2](https://img.shields.io/badge/Version-5.2.2-informational?style=flat-square) ![AppVersion: 1.1.2](https://img.shields.io/badge/AppVersion-1.1.2-informational?style=flat-square)

A Helm chart for the Vertical Pod Autoscaler.

**Homepage:** <https://github.com/giantswarm/vertical-pod-autoscaler-app>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://cowboysysop.github.io/charts | vertical-pod-autoscaler | 9.8.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.imageRegistry | string | `"gsoci.azurecr.io"` |  |
| vertical-pod-autoscaler.admissionController.extraArgs.kube-api-burst | int | `75` |  |
| vertical-pod-autoscaler.admissionController.extraArgs.kube-api-qps | int | `50` |  |
| vertical-pod-autoscaler.admissionController.extraArgs.webhook-timeout-seconds | int | `5` |  |
| vertical-pod-autoscaler.admissionController.image.registry | string | `"gsoci.azurecr.io"` |  |
| vertical-pod-autoscaler.admissionController.image.repository | string | `"giantswarm/vpa-admission-controller"` |  |
| vertical-pod-autoscaler.admissionController.metrics.serviceMonitor.enabled | bool | `true` |  |
| vertical-pod-autoscaler.admissionController.pdb.create | bool | `true` |  |
| vertical-pod-autoscaler.admissionController.replicaCount | int | `2` |  |
| vertical-pod-autoscaler.admissionController.resources.limits.cpu | string | `"500m"` |  |
| vertical-pod-autoscaler.admissionController.resources.requests.cpu | string | `"250m"` |  |
| vertical-pod-autoscaler.admissionController.resources.requests.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.admissionController.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| vertical-pod-autoscaler.admissionController.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| vertical-pod-autoscaler.admissionController.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| vertical-pod-autoscaler.admissionController.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.containerPolicies.controlledResources[0] | string | `"cpu"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.containerPolicies.controlledResources[1] | string | `"memory"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.containerPolicies.minAllowed.cpu | string | `"250m"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.containerPolicies.minAllowed.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.containerPolicies.mode | string | `"Auto"` |  |
| vertical-pod-autoscaler.admissionController.verticalPodAutoscaler.enabled | bool | `false` |  |
| vertical-pod-autoscaler.crds.image.registry | string | `"gsoci.azurecr.io"` |  |
| vertical-pod-autoscaler.crds.image.repository | string | `"giantswarm/kubectl"` |  |
| vertical-pod-autoscaler.crds.image.tag | string | `"1.29.3"` |  |
| vertical-pod-autoscaler.crds.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| vertical-pod-autoscaler.crds.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| vertical-pod-autoscaler.crds.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| vertical-pod-autoscaler.crds.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| vertical-pod-autoscaler.recommender.extraArgs.kube-api-burst | int | `75` |  |
| vertical-pod-autoscaler.recommender.extraArgs.kube-api-qps | int | `50` |  |
| vertical-pod-autoscaler.recommender.extraArgs.memory-saver | bool | `true` |  |
| vertical-pod-autoscaler.recommender.extraArgs.oom-bump-up-ratio | float | `2` |  |
| vertical-pod-autoscaler.recommender.extraArgs.pod-recommendation-min-cpu-millicores | int | `50` |  |
| vertical-pod-autoscaler.recommender.extraArgs.pod-recommendation-min-memory-mb | int | `250` |  |
| vertical-pod-autoscaler.recommender.extraArgs.target-cpu-percentile | float | `0.95` |  |
| vertical-pod-autoscaler.recommender.image.registry | string | `"gsoci.azurecr.io"` |  |
| vertical-pod-autoscaler.recommender.image.repository | string | `"giantswarm/vpa-recommender"` |  |
| vertical-pod-autoscaler.recommender.livenessProbe.failureThreshold | int | `5` |  |
| vertical-pod-autoscaler.recommender.livenessProbe.initialDelaySeconds | int | `45` |  |
| vertical-pod-autoscaler.recommender.livenessProbe.periodSeconds | int | `15` |  |
| vertical-pod-autoscaler.recommender.metrics.serviceMonitor.enabled | bool | `true` |  |
| vertical-pod-autoscaler.recommender.podAnnotations."cluster-autoscaler.kubernetes.io/safe-to-evict" | string | `"true"` |  |
| vertical-pod-autoscaler.recommender.readinessProbe.failureThreshold | int | `5` |  |
| vertical-pod-autoscaler.recommender.readinessProbe.initialDelaySeconds | int | `30` |  |
| vertical-pod-autoscaler.recommender.readinessProbe.periodSeconds | int | `15` |  |
| vertical-pod-autoscaler.recommender.resources.requests.cpu | string | `"500m"` |  |
| vertical-pod-autoscaler.recommender.resources.requests.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.recommender.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| vertical-pod-autoscaler.recommender.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| vertical-pod-autoscaler.recommender.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| vertical-pod-autoscaler.recommender.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.containerPolicies.controlledResources[0] | string | `"cpu"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.containerPolicies.controlledResources[1] | string | `"memory"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.containerPolicies.minAllowed.cpu | string | `"250m"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.containerPolicies.minAllowed.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.containerPolicies.mode | string | `"Auto"` |  |
| vertical-pod-autoscaler.recommender.verticalPodAutoscaler.enabled | bool | `false` |  |
| vertical-pod-autoscaler.updater.extraArgs.kube-api-burst | int | `75` |  |
| vertical-pod-autoscaler.updater.extraArgs.kube-api-qps | int | `50` |  |
| vertical-pod-autoscaler.updater.extraArgs.min-replicas | int | `1` |  |
| vertical-pod-autoscaler.updater.image.registry | string | `"gsoci.azurecr.io"` |  |
| vertical-pod-autoscaler.updater.image.repository | string | `"giantswarm/vpa-updater"` |  |
| vertical-pod-autoscaler.updater.livenessProbe.failureThreshold | int | `5` |  |
| vertical-pod-autoscaler.updater.livenessProbe.initialDelaySeconds | int | `45` |  |
| vertical-pod-autoscaler.updater.livenessProbe.periodSeconds | int | `15` |  |
| vertical-pod-autoscaler.updater.metrics.serviceMonitor.enabled | bool | `true` |  |
| vertical-pod-autoscaler.updater.podAnnotations."cluster-autoscaler.kubernetes.io/safe-to-evict" | string | `"true"` |  |
| vertical-pod-autoscaler.updater.readinessProbe.failureThreshold | int | `5` |  |
| vertical-pod-autoscaler.updater.readinessProbe.initialDelaySeconds | int | `30` |  |
| vertical-pod-autoscaler.updater.readinessProbe.periodSeconds | int | `15` |  |
| vertical-pod-autoscaler.updater.resources.requests.cpu | string | `"500m"` |  |
| vertical-pod-autoscaler.updater.resources.requests.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.updater.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| vertical-pod-autoscaler.updater.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| vertical-pod-autoscaler.updater.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| vertical-pod-autoscaler.updater.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.containerPolicies.controlledResources[0] | string | `"cpu"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.containerPolicies.controlledResources[1] | string | `"memory"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.containerPolicies.minAllowed.cpu | string | `"250m"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.containerPolicies.minAllowed.memory | string | `"250Mi"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.containerPolicies.mode | string | `"Auto"` |  |
| vertical-pod-autoscaler.updater.verticalPodAutoscaler.enabled | bool | `false` |  |
