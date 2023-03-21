[![CircleCI](https://circleci.com/gh/giantswarm/vertical-pod-autoscaler-app.svg?style=shield)](https://circleci.com/gh/giantswarm/vertical-pod-autoscaler-app)

# vertical-pod-autoscaler-app chart

Giant Swarm offers a vertical-pod-autoscaler Managed App which can be installed in workload clusters.
Here we define the vertical-pod-autoscaler chart with its templates and default configuration.

You should read our [public documentation](https://docs.giantswarm.io/getting-started/operations/autoscaling/vertical-pod-autoscaler)

## Example

You can create a `verticalpodautoscaler` or `vpa` resource that will monitor/update other resources in the same namespace.

Syntax looks like this:

```
apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: fluent-logshipping-app
  namespace: monitoring
spec:
  resourcePolicy:
    containerPolicies:
    - containerName: fluent-bit
      controlledResources:
      - memory
      maxAllowed:
        memory: 500Mi
      minAllowed:
        memory: 100Mi
      mode: Auto
  targetRef:
    apiVersion: apps/v1
    kind: DaemonSet
    name: fluent-logshipping-app
  updatePolicy:
    updateMode: Auto
```

This one will look for `fluent-bit` containers from the `fluent-logshipping-app` DaemonSet, and will act on memory.
It will automatically adjust the pod's memory `requests` between `100Mi` and `500Mi`.

## Moving from 2.X.X to 3.X.X - Breaking change

Please note that this app is now based on this [upstream chart](https://github.com/cowboysysop/charts/tree/master/charts/vertical-pod-autoscaler) so if some changes need to be applied to the vpa configuration, one may check the upstream values file to check out the additional fields that can be added to our own values.

### Changes since migration to new upstream repo

Up until mid-february 2023, the vertical-pod-autoscaler-app was using [this upstream chart](https://github.com/FairwindsOps/charts/tree/master/stable/vpa) but since it was not maintained anymore, we decided to move to our current upstream chart as precised above.

There are significant changes with this migration :
- Old version :
```
├── helm
│   └── vertical-pod-autoscaler-app
│       ├── templates
│       │   ├── _helpers.tpl
│       │   ├── crd-patch
│       │   │   └── [...]
│       │   ├── tests
│       │   │   └── [...]
│       │   ├── [...]
│       ├── Chart.yaml
│       ├── values.schema.json
│       └── values.yaml
```

- Current version :
```
├── helm
│   └── vertical-pod-autoscaler-app
│       ├── ci
│       │   └── test-values.yaml
│       ├── templates
│       │   ├── _helpers.tpl
│       │   ├── admission-controller
│       │   │   ├── [...]
│       │   ├── recommender
│       │   │   └── [...]
│       │   ├── tests
│       │   │   └── [...]
│       │   └── updater
│       │       └── [...]
│       ├── Chart.yaml
│       ├── values.schema.json
│       └── values.yaml
```

Among the changes, the most notable ones are :
- Having a folder for each VPA components (admission-controller, recommender and updater) whereas in the previous repository all components were defined directly in the `templates` folder.
- The crd-patch components were updated. It now consists of a job patching the VPA CRDs to remove the following annotations : `meta.helm.sh/release-name` and `meta.helm.sh/release-namespace` so that we will be able to get rid of the `giantswarm/vertical-pod-autoscaler-crd` repository and rely solely on this `vertical-pod-autoscaler-app` one to deploy the CRDs.

## Migration

When migrating this chart to the new upstream, it included a job to apply the VPA CRDs so we decided to go without the vertical-pod-autoscaler-crd in the future.
To do so, we added a job to remove the helm ownership labels from the crds so we can remove the vertical-pod-autoscaler-crd app from clusters in a subsequent release.

As we need to wait for customers to upgrade to any VPA 3.x+ version before we remove the crd app, we will only do so in the next major release of our product.

## Credit

* https://github.com/kubernetes/autoscaler
