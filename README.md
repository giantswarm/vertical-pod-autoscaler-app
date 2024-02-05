[![CircleCI](https://circleci.com/gh/giantswarm/vertical-pod-autoscaler-app.svg?style=shield)](https://circleci.com/gh/giantswarm/vertical-pod-autoscaler-app)

# Vertical Pod Autoscaler

Giant Swarm offers a Vertical Pod Autoscaler managed app which can be installed in workload clusters. Here we define the chart with its templates and default configuration.

Additional reading can be found in our [public documentation](https://docs.giantswarm.io/getting-started/operations/autoscaling/vertical-pod-autoscaler).

## Example

You can create a `VerticalPodAutoscaler` resource that will monitor and update other resources in the same namespace:

```
apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: fluent-logshipping
  namespace: monitoring
spec:
  targetRef:
    apiVersion: apps/v1
    kind: DaemonSet
    name: fluent-logshipping
  resourcePolicy:
    containerPolicies:
    - containerName: fluent-bit
      controlledResources:
      - memory
      mode: Auto
      minAllowed:
        memory: 100Mi
      maxAllowed:
        memory: 500Mi
  updatePolicy:
    updateMode: Auto
```

This will look for `fluent-bit` containers of the `fluent-logshipping` DaemonSet and manage their memory requests. It will automatically adjust it between `100Mi` and `500Mi`.
