[![CircleCI](https://circleci.com/gh/giantswarm/vertical-pod-autoscaler-app.svg?style=shield)](https://circleci.com/gh/giantswarm/vertical-pod-autoscaler-app)

# vertical-pod-autoscaler-app chart

Giant Swarm offers a vertical-pod-autoscaler Managed App which can be installed in tenant clusters.
Here we define the vertical-pod-autoscaler chart with its templates and default configuration.

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

## Credit

* https://github.com/kubernetes/autoscaler
