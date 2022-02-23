# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/giantswarm/vertical-pod-autoscaler-app/compare/v2.1.1...HEAD
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
