# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Add cilium network policy so that the crd-install job can reach the k8s api to install the CRDs.

### Changed

- Remove `push-to-app-collection` jobs for onprem providers since this app became a part of default apps bundle.
<<<<<<< HEAD
- Moved to chart dependency
- ⚠ Major upgrade, breaking changes
  - values structure changes. We rely on a subchart, meaning all of previous setup goes to a `vpa` section
=======
>>>>>>> fa2f1ec6f041b825ae131b9cab9c5b6a4cb40590

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

[Unreleased]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.5.3...HEAD
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
