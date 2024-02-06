from pytest import mark
from pytest_helm_charts.clusters import Cluster
from pytest_helm_charts.giantswarm_app_platform.app import wait_for_apps_to_run
from pytest_helm_charts.k8s.deployment import wait_for_deployments_to_run

@mark.smoke
@mark.functional
@mark.upgrade
def test_vertical_pod_autoscaler(kube_cluster: Cluster) -> None:
    assert kube_cluster.kube_client is not None

    # Wait for vertical-pod-autoscaler app to run.
    wait_for_apps_to_run(kube_cluster.kube_client, [ "vertical-pod-autoscaler-app" ], "kube-system", 60)

    # Wait for vertical-pod-autoscaler deployments to run.
    wait_for_deployments_to_run(kube_cluster.kube_client, [ "vertical-pod-autoscaler-app-admission-controller", "vertical-pod-autoscaler-app-recommender", "vertical-pod-autoscaler-app-updater" ], "kube-system", 60)
