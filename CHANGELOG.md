# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [Unreleased]

### Changed

- Chart: Update Helm release vertical-pod-autoscaler to v10.0.0 ([#335](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/335))

## [5.3.1] - 2025-01-20

### Changed

- Chart: Update Helm release vertical-pod-autoscaler to v9.9.1. ([#333](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/333))

## [5.3.0] - 2024-09-02

### Changed

- Chart: Update Helm release vertical-pod-autoscaler to v9.9.0. ([#314](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/314))
- Chart: Consume `global.imageRegistry`. ([#315](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/315))

### Removed

- Chart: Do not override `crds.image.tag`. ([#316](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/316))

## [5.2.4] - 2024-07-09

### Changed

- Chart: Update Helm release vertical-pod-autoscaler to v9.8.3. ([#301](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/301))

## [5.2.3] - 2024-06-25

### Changed

- Chart: Change `restartPolicy` to `OnFailure` for the CRD job. ([#298](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/298))

## [5.2.2] - 2024-05-21

### Changed

- Chart: Update `appVersion` and `README.md`, VPA v1.1.2. ([#293](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/293))

## [5.2.1] - 2024-04-11

### Changed

- Chart: Update `appVersion` and `README.md`. ([#281](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/281))

## [5.2.0] - 2024-04-11

### Changed

- Chart: Update Helm release vertical-pod-autoscaler to v9.8.0. ([#279](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/279))

## [5.1.0] - 2024-02-11

### Added

- Repository: Add ATS. ([#267](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/267))

### Changed

- Chart: Improve readability of image tag. ([#263](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/263))
- Repository: Chores. ([#266](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/266))
  - Repository: Move `.kube-linter.yaml`.
  - Repository: Rework ABS.
  - Repository: Rework CircleCI.
  - Repository: Rework README.
  - Chart: Regenerate values schema JSON.
  - Chart: Rework `Chart.yaml`.
  - Chart: Rework `README.md.gotmpl`.
- Chart: Rework chart. ([#269](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/269))
  - Chart: Rework helpers.
  - Chart: Rework vertical pod autoscalers.
  - Chart: Rework policy exceptions.
  - Chart: Rework network policies.
  - Chart: Rework CRD patch.
- Chart: PSS compliance. ([#270](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/270))

### Removed

- Repository: Chores. ([#266](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/266))
  - Repository: Remove unused script.
  - Repository: Remove `.nancy-ignore*`.
  - Repository: Remove images.
  - Repository: Remove config.
  - Repository: Remove `.gitignore`.
  - Chart: Remove `.helmignore`.
  - Chart: Remove useless CI values.
- Chart: Rework chart. ([#269](https://github.com/giantswarm/vertical-pod-autoscaler-app/pull/269))
  - Chart: Remove global network policies.

## [5.0.0] - 2024-01-17

### Changed

- Change ImageRegistry to `gsoci.azurecr.io`.
- Upgrade dependency chart to 9.6.0
- Upgrade VPA components to 1.0.0

## [4.6.0] - 2023-10-31

### Changed

- Revert docker image to `0.14.0`

## [4.5.0] - 2023-10-31

### Changed

- Revert chart dependency to `9.3.0`.

## [4.4.0] - 2023-10-27

### Changed

- Verify Kyverno CRD being present.

## [4.3.0] - 2023-10-26

### Added

- Added PSS Exceptions.

## [4.2.0] - 2023-09-19

### Changed

- In order to facilitate the migration from aws-cni to cilium we need to keep the standard network policies in place so that VPA can communicate with the k8s API while the clusters are being upgraded

## [4.1.0] - 2023-09-19

### Changed

- Updated to upstream char version 9.3.0 which allows to set the `topologySpreadConstraints` for all 3 VPA components (updater, recommender and admission controller)
- Removed `/metrics` rule in the updater cilium network policy because it can cause delays in the application availability when switching from a different CNI over to Cilium

## [4.0.0] - 2023-08-30

### Changed

WARNING: this version requires Cilium to run because of the dependency on the CiliumNetworkPolicy CRD

- Upgrade dependency chart to 9.2.0.
- Adjusted the resource and limits to accomodate larger clusters by default
- Adjusted the admission controller to give it more QPS against the API
- Adjusted the updater to give it more QPS against the API
- Adjusted the recommender to give it
  - more QPS against the API
  - doubling the memory in case of an OOMKilled event
  - Using the 95% percentile for the calculation of the CPU usage: should allow to scale up more precisely to account for spikes in CPU consumption of the workload
  - Adjusted the resource and limits to accomodate larger clusters by default
  - Calculating recommendations only for workloads which do have a VPA custom resource, instead of all workloads
  - Removed standard network policies to decrease maintenance burden
  - Fixed Cilium Network Policy to allow CRD jobs execution
  - Added Cilium Network Policy weight for an early execution
  - Disabled VPA for the updater pod otherwise it keeps on getting re-scheduled because the memory consumption varies a lot between reconsiling resources and idle
  - Disabled VPA for the recommender pod otherwise it keeps on getting re-scheduled because the memory consumption varies a lot between reconsiling resources and idle

## [3.5.4] - 2023-08-03

- Specified failureThreshold and periodSeconds for recommender's liveness probe.
- Upgrade dependency chart to 7.1.0.
- Upgrade VPA components to 0.14.0


## [3.5.3] - 2023-06-28

### Added

- Add `cluster-autoscaler safe-to-evict` annotation to `recommender` and `updater`

## [3.5.2] - 2023-06-23

## Changed

- Raised limits for all components.

## [3.5.1] - 2023-06-14

### Changed

- Raised resources for updater and recommender.

## [3.5.0] - 2023-06-13

### Changed

- `Drop all CAPabilities` in container SecurityContext for Kyverno Policy compliance
- Set `AllowPrivilegeEscalation=false` in container SecurityContext for Kyverno Policy compliance

## [3.4.2] - 2023-04-12

### Changed

- Remove circleci job for pushing to shared app collection

## [3.4.1] - 2023-04-05

### Changed

- Disable PDB for recommender and updater since we only run 1 replica of those pods.

## [3.4.0] - 2023-04-04

### Added

- Add cilium network policies.

## [3.3.1] - 2023-03-27

### Added

- Added the use of the runtime default seccomp profile.

## [3.3.0] - 2023-03-21

### Changed

- Sync with upstream update concerning image.registry

## [3.2.0] - 2023-03-08

### Added

- Add VPA CR to VPA.

## [3.1.0] - 2023-03-08

### Changed

- Upgrade to AppVersion 0.13.0

## [3.0.0] - 2023-03-07

### Added

- Add cilium network policy so that the crd-install job can reach the k8s api to install the CRDs.
- README: doc improvements

### Changed

- Remove `push-to-app-collection` jobs for onprem providers since this app became a part of default apps bundle.
- Moved to chart dependency
- ⚠ Major upgrade, breaking changes
  - values structure changes. We rely on a subchart, meaning all of previous setup goes to a `vertical-pod-autoscaler` section
  - the upstream repo has changed and thus as did the helm chart config
  - for more detailed explanations, check the README

## [2.5.3] - 2023-01-10

### Changed

- Increased memory limits for updater, recommender and admissionController

## [2.5.2] - 2022-12-02

- Using custom docker image with openssl to fix vpa-certgen job

## [2.5.1] - 2022-11-29

### Changed

- Adding `application.giantswarm.io/team` label to kubernetes resources
- Removing openssl update in `vertical-pod-autoscaler-certgen` container

## [2.5.0] - 2022-08-08

### Changed

- Upgrade vertical-pod-autoscaler to [0.11.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.11.0)

  Potentially breaking change:
  - Added validation - CPU values will be accepted only with resolution of 1 mCPU, memory with resolution of 1 b

  Other changes:
    - Switch to go 1.16
    - Admission controller now logs when it fails to start
    - Increase resolution of admission_latency_seconds metric
    - Reduce verbosity of some logs

## [2.4.2] - 2022-07-27

### Changed

- Change default webhook timeout to 5 seconds

## [2.4.1] - 2022-07-05

### Fixed

- Correct selector in admission controller PDB

## [2.4.0] - 2022-05-24

### Changed

- Use patched docker image tagged `0.10.0-oomfix` for `recommender` and updater (see https://github.com/giantswarm/roadmap/issues/923).

## [2.3.0] - 2022-05-10

### Changed

- Upgrade vertical-pod-autoscaler to [0.10.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.10.0)
  API changes:
      Added support for alternative recommenders.
      Added support for per-VPA Object MinReplicas.

  Other notable changes:
      Added support for running VPA out of cluster.
      Use v1 API for storage instead of v1beta2.
      Allow configuring default update threshold.
      Use v1 API to register admission webhook.

  Bug fixes:
      Use correct timestamp for checkpoints.
      Issues with setting limits.
      Deploying VPA in different namespaces.
      Loading history.


### Fixed

- Fix admission-controller webhook-service name.
- Fix webhook name in generated secret certificate.
- Prefix generated secret certificate with release-name.

## [2.2.0] - 2022-05-04

### Changed

- Change log-level from default=4 to 3.
- Rename resources to include release name as prefix and avoid name collision.

## [2.1.2] - 2022-02-23

### Fixed

- Fixed default value for admission controller PDB.

## [2.1.1] - 2022-02-08

### Fixed

- Fix naming of VPA deployments in workload clusters.

## [2.1.0] - 2022-02-08

### Added

- Network Policy for VPA.

## [2.0.0] - 2022-02-01

### Added

- Add VPA app to default catalog.

### Removed

- Move CRDs to giantswarm/vertical-pod-autoscaler-crd app.

## [1.2.0] - 2021-08-12

### Changed

- Migrate to configuration management.
- Update `architect-orb` to v4.0.0.

## [1.1.1] - 2021-03-30

### Fixed

- Set updated namespace so the updater can find the lease.

## [1.1.0] - 2021-03-23

### Added

- Add `application.giantswarm.io/owners` annotation to Chart.yaml for routing
alerts.

### Changed

- Upgrade vertical-pod-autoscaler from 0.8.0 to 0.9.2
  - https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.9.2
  - https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.9.0
  - https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.8.1

## [1.0.3] - 2020-12-13

### Fixed

- Fix incorrect scraping port annotation values

## [1.0.2] - 2020-12-11

### Fixed

- Fix incorrect port values

## [1.0.1] - 2020-12-11

### Fixed

- Moved monitoring labels and annotations to monitoring services

## [1.0.0] - 2020-11-27

### Added

- First vertical-pod-autoscaler version 0.8.0

[Unreleased]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v5.3.1...HEAD
[5.3.1]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v5.3.0...v5.3.1
[5.3.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v5.2.4...v5.3.0
[5.2.4]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v5.2.3...v5.2.4
[5.2.3]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v5.2.2...v5.2.3
[5.2.2]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v5.2.1...v5.2.2
[5.2.1]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v5.2.0...v5.2.1
[5.2.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v5.1.0...v5.2.0
[5.1.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v5.0.0...v5.1.0
[5.0.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v4.6.0...v5.0.0
[4.6.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v4.5.0...v4.6.0
[4.5.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v4.4.0...v4.5.0
[4.4.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v4.3.0...v4.4.0
[4.3.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v4.2.0...v4.3.0
[4.2.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v4.1.0...v4.2.0
[4.1.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v4.0.0...v4.1.0
[4.0.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.5.4...v4.0.0
[3.5.4]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.5.3...v3.5.4
[3.5.3]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.5.2...v3.5.3
[3.5.2]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.5.1...v3.5.2
[3.5.1]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.5.0...v3.5.1
[3.5.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.4.2...v3.5.0
[3.4.2]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.4.1...v3.4.2
[3.4.1]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.4.0...v3.4.1
[3.4.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.3.1...v3.4.0
[3.3.1]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.3.0...v3.3.1
[3.3.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.2.0...v3.3.0
[3.2.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.1.0...v3.2.0
[3.1.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v3.0.0...v3.1.0
[3.0.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.5.3...v3.0.0
[2.5.3]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.5.2...v2.5.3
[2.5.2]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.5.1...v2.5.2
[2.5.1]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.5.0...v2.5.1
[2.5.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.4.2...v2.5.0
[2.4.2]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.4.1...v2.4.2
[2.4.1]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.4.0...v2.4.1
[2.4.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.3.0...v2.4.0
[2.3.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.2.0...v2.3.0
[2.2.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.1.2...v2.2.0
[2.1.2]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.1.1...v2.1.2
[2.1.1]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.1.0...v2.1.1
[2.1.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v1.2.0...v2.0.0
[1.2.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v1.1.1...v1.2.0
[1.1.1]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v1.0.3...v1.1.0
[1.0.3]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v1.0.2...v1.0.3
[1.0.2]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/giantswarm/vertical-pod-autoscaler-app/releases/tag/v1.0.0
