[![CircleCI](https://circleci.com/gh/giantswarm/vertical-pod-autoscaler-app.svg?style=shield)](https://circleci.com/gh/giantswarm/vertical-pod-autoscaler-app)

# vertical-pod-autoscaler-app chart

Giant Swarm offers a vertical-pod-autoscaler Managed App which can be installed in tenant clusters.
Here we define the vertical-pod-autoscaler chart with its templates and default configuration.

Please note that this app is based on this [upstream chart](https://github.com/cowboysysop/charts/tree/master/charts/vertical-pod-autoscaler) so if some changes need to be applied to the vpa configuration, one may check the upstream values file to check out the additional fields that can be added to our own values.

## Changes since migration to new upstream repo

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
- Having folder for each VPA components (admission-controller, recommender and updater) whereas in the previous repository all components were defined directly in the `templates` folder.
- We got rid of the crd-patch folder which was using a job to patch the crd.

## Credit

* https://github.com/kubernetes/autoscaler
