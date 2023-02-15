[![CircleCI](https://circleci.com/gh/giantswarm/vertical-pod-autoscaler-app.svg?style=shield)](https://circleci.com/gh/giantswarm/vertical-pod-autoscaler-app)

# vertical-pod-autoscaler-app chart

Giant Swarm offers a vertical-pod-autoscaler Managed App which can be installed in tenant clusters.
Here we define the vertical-pod-autoscaler chart with its templates and default configuration.

Please note that this app is based on this [upstream chart](https://github.com/cowboysysop/charts/tree/master/charts/vertical-pod-autoscaler) so if some changes need to be applied to the vpa configuration, one may check the upstream values file to check out the additional fields that can be added to our own values.

## Credit

* https://github.com/kubernetes/autoscaler
