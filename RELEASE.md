# Sensa Helm Chart 1.5.26 Release Notes (2025-03-12)

## Significant Changes

### Images have been updated

- `styx`, `web`, and `zeus` have been updated to v4.6.0

### Internal

- Update dependencies to include `sensa-hooks`, `sensa-ingress`, and `sensa-secrets`

# Sensa Helm Chart 1.5.25 Release Notes (2025-01-16)

## Significant Changes

### Images have been updated

- `styx`, `web`, and `zeus` have been updated to v4.5.1

### Fixes

- Fix reference to non-existing chart versions in `charts/sensa/values.yaml`

### Internal

- Update chart dependencies to local repository for:

  - hades
  - hermes
  - hive-metastore
  - styx
  - trino
  - web
  - wlm
  - zeus

- Adjust indentation in `charts/sensa/values.yaml` to address linting errors

# Sensa Helm Chart 1.5.24 Release Notes (2024-12-10)

## Significant Changes

### Images have been updated

- trino has been updated to version 462
- meilisearch has been updated from v1.0.2 to v1.10.3
- styx, web, and zeus have been updated to v4.5.0
- hive-metastore has been updated to v4.5.0
- hyperkube has been updated to v4.5.9

- Update container registry from dockerhub to ACR for:
  - hades
  - hermes
  - hive-metastore
  - hyperkube
  - styx
  - web
  - wlm
  - zeus

### Configurations added and updated

- Update trino configuration to be compliant with version 462

## New features

- Added hook to delete meilisearch data when upgrading from v1.0.2<sup>1</sup>

###### (1) Depends on hook to force meilisearch reindex after upgrades

# Sensa Helm Chart 1.5.19 Release Notes (2024-10-03)

## Significant Changes

### Images have been updated

- trino has been updated to version 446
- styx, web, and zeus have been updated to v4.4.2

# Sensa Helm Chart 1.5.18 Release Notes (2024-10-02)

## Significant Changes

### Images have been updated

- trino-coordinator has been changed to use trino repo
- trino-coordinator has been changed to version 422

### Configurations added and updated

- Updated trino to use bitnami jmx-exporter for prometheus metrics

# Sensa Helm Chart 1.5.15 Release Notes (2024-07-19)

## Significant Changes

### Images have been updated

- web has been updated to v4.4.1

### Configurations added and updated

- Updated meilisearch pvc mount path to ensure data persistence

## New features

- Added hook to force meilisearch reindex after upgrades

# Sensa Helm Chart 1.5.14 Release Notes (2024-05-20)

## Significant Changes

### Images have been updated

- styx, web, and zeus have been updated to v4.4.0

# Sensa Helm Chart 1.5.13 Release Notes (2024-05-09)

## Significant Changes

### Images have been updated

- web has been updated to v4.3.3
- zeus has been updated to v4.3.4

# Sensa Helm Chart 1.5.11 Release Notes (2024-05-02)

## Significant Changes

### Configurations added and updated

- Added ability to setup services to use and accept internal CAs
- Added internal CA parameters to hermes, hades, styx, and zeus deployments

## Removed features

- sensajs has been removed

# Sensa Helm Chart 1.5.7 Release Notes (2024-04-23)

## Significant Changes

### Images have been updated

- hades has been updated to v4.3.2

### Configurations added and updated

- Added ability to set proxy server to environment using proxy_server and proxy_port global values
- Added proxy_server and proxy_port parameters to hades, hermes, styx, and zeus deployments
- Added LOAD_BALANCER_TYPE parameter to global-values.yaml
- Removed istio sidecar from hermes
- Added authorizationpolicy to allow Sensa access to Kubeflow

# Sensa Helm Chart 1.5.5 Release Notes (2024-04-08)

## Significant Changes

### Images have been updated

- hades has been updated to v4.3.0
- hermes, styx, sensajs, web, and zeus have been updated to v4.3.2

# Sensa Helm Chart 1.5.4 Release Notes (2024-03-20)

## Significant Changes

### Images have been updated

- hermes, styx, sensajs, web, and zeus have been updated to v4.3.1

# Sensa Helm Chart 1.5.2 Release Notes (2024-03-14)

## Significant Changes

### Configurations added and updated

- Changed postgresql.array-mapping to AS_ARRAY
- Fixed a typo in the statefulset in the mino configuration

### Images have been updated

- hermes, hive-metastore, hyperkube, styx, sensajs, trino-coordinator, web, and zeus have been updated to v4.3.0

# Sensa Helm Chart 1.4.9 Release Notes (2024-02-06)

## Significant Changes

### Configurations added and updated

- postgresql.array-mapping=AS_JSON added to trino postgresql catalog
- unsupported-type-handling=CONVERT_TO_VARCHAR added to trino postgresql catalog

# Sensa Helm Chart 1.4.7 Release Notes (2024-01-30)

### Configurations added and updated

- wlm has been set to install by default

### Images have been updated

- wlm has been updated to v1.0.0-a4

## New features

- fluent-bit has been added as a separate chart

# Sensa Helm Chart 1.4.5 Release Notes (2023-12-12)

### Configurations added and updated

- SENSAJS_INGRESS_HOST added to global values to accommodate sensajs integrations

### Images have been updated

- trino-coordinator has been updated to v4.2.0

## New features

- sensajs added for NetReveal integrations

# Sensa Helm Chart 1.4.4 Release Notes (2023-12-07)

## Significant Changes

### Configurations added and updated

- Added STYX_CONCURRENT_BATCH_LIMIT to better control styx throughput

### Images have been updated

- hades has been updated to v4.2.1
- hermes, hive-metastore, styx, web, and zeus have been updated to v4.2.0
- hyperkube has been updated to v4.2.9

## New features

- Added logic to handle a null value for SENSA_RABBIT_MQ_DEFAULT_QUEUE

# Sensa Helm Chart 1.4.2 Release Notes (2023-11-09)

## Significant Changes

### Images have been updated

- hyperkube has been updated to v4.2.8

## New features

- Fixed hooks to accommodate Sensa being installed in namespaces other than sensa

# Sensa Helm Chart 1.4.1 Release Notes (2023-10-31)

## Significant Changes

### Configurations added and updated

- Updated postgres max connections limit to 500
- Added variable to allow setting custom user name for minio user
- Added variable to allow setting a bucket to designate for backups in minio
- Changed global password to be used only for user-exposed services (minio, trino, prometheus, API)
- Added new SENSA_SERVICES_PASSWORD to be used for inner-service communication
- Moved hive-metastore configmap to secret to accommodate change to SENSA_SERVICES_PASSWORD
- Cleaned up hooks and moved hook commands from yaml stringData to script files
- Changed hyperkube image repository to variable pulled from values.yaml
- Fixed hook-delete-policy to prevent errors during upgrades after a failed upgrade
- Added additional error handling in post-install hooks to prevent hanging jobs
- Moved all sensa-hooks containers to use hyperkube

### Images have been updated

- hyperkube has been updated to v4.2.6
- web has been updated to v4.1.1
- zeus has been updated to v4.1.3

## New features

- Added the ability to change the global password via helm upgrade
- Added hooks to update internal service passwords for installations that had all services using global password

# Sensa Helm Chart 1.3.37 Release Notes (2023-10-18)

## Significant Changes

### Images have been updated

- zeus has been updated to v4.1.2

# Sensa Helm Chart 1.3.36 Release Notes (2023-10-13)

## Significant Changes

### Configurations added and updated

- Fixed trino-worker resource limits and requests
- Updated redis master configuration to allow flushing cache
- Increased SENSA_BATCH_SIZE to 100000

### Images have been updated

- hive-metastore has been updated to v4.1.0
- styx has been updated to v4.1.4

# Sensa Helm Chart 1.3.30 Release Notes (2023-10-04)

## Significant Changes

### Configurations added and updated

- Added SENSA_BATCH_SIZE environment variable to styx

### Images have been updated

- styx has been updated to v4.1.3

# Sensa Helm Chart 1.3.29 Release Notes (2023-09-18)

## Significant Changes

### Configurations added and updated

- Changed redis to not persist data to disk and removed the redis PVCs
- Changed hades environment variable from SENSA_API_KEY to SENSA_API_KEY_SECRET
- Added CPU requests to trino-worker configuration
- Added environment variables to styx for use with Sentry and RabbitMQ
- Added environment variables to hades, hermes, styx, and zeus for redis indexes

### Images have been updated

- pre-upgrade hook has had hyperkube image updated to v4.1.0
- hades has been updated to v4.1.3
- hermes has been updated to v4.1.0
- kafka has been updated to 3.5.0-debian-11-r21
- kube-prometheus has been updated to 2.46.0-debian-11-r5
- minio has been updated to 2023.7.18-debian-11-r0
- postgres has been updated to 15.3.0-debian-11-r24
- redis has been updated to 7.0.12-debian-11-r2
- styx has been updated to v4.1.1
- trino-coordinator, web, and zeus have been updated to v4.1.0

## New features

- Added post-upgrade hook to restart services in correct order after service upgrades
- Updated pre-upgrade hook to fix issue with switching redis to not persist data
- Added post-install hook to ensure services are started in the correct order
- Added WLM service version v1.0.0-a3 for processing SWIFT messages
- Added RabbitMQ service version 3.12.4-debian-11-r0

# Sensa Helm Chart 1.3.27 Release Notes (2023-08-24)

## Significant Changes

### Configurations added and updated

- service user and access control list added to datalake configuration
- insert.non-transactional-insert.enabled added to trino postgresql catalog

### Images have been updated

- trino has been updated to 422

# Sensa Helm Chart 1.3.24 Release Notes (2023-08-11)

## Significant Changes

### Configurations added and updated

- styx URL added to global values
- styx environment variable added to API

### Images have been updated

- hades has been updated to v4.0.0

## New features

- styx added for datalake integrations

# Sensa Helm Chart 1.3.19 Release Notes (2023-07-27)

## Significant Changes

### Configurations added and updated

- Added tag to allow bypassing kube-prometheus install
- Increase max_connections in postgres
- Increase hive.max-partitions-per-writers setting in trino
- Updated trino worker configurations to optimize performance

### Images have been updated

- hermes, web, and zeus have been updated to v4.0.0

## New features

- Setup JWT tokens to auto-generate on install and use existing values on upgrade

# Sensa Helm Chart 1.3.17 Release Notes (2023-06-14)

## Significant Changes

### Configurations added and updated

- Added readinessProbe initialDelaySeconds to trino-coordinator and trino-worker

# Sensa Helm Chart 1.3.15 Release Notes (2023-06-02)

## Significant Changes

### Configurations added and updated

- Changed trino catalog minio connector to use MICROSECONDS
- Updated trino java memory settings
- Updated trino autoscaling template to use v2
- Changed trino catalog from configmap to secret

# Sensa Helm Chart 1.3.13 Release Notes (2023-05-25)

## Significant Changes

### Images have been updated

- meilisearch has been updated to v1.0.2

# Sensa Helm Chart 1.3.12 Release Notes (2023-03-28)

## Significant Changes

### Configurations added and updated

- Added istio sidecar to hermes
- Added authorizationpolicy and destinationrule to allow traffic between hermes and Kubeflow
- Change trino configmap to replace deprecated value
- Added templates to create tokens for service accounts
- Added postgres catalog to trino
- Change services to use internal API URL

### Images have been updated

- hermes has been updated to v3.0.3
- post-install hook image for create-minio-policy-and-user has been changed to 2023.1.31-debian-11-r0
- trino has been updated to version 409
- web and zeus images have been updated to 3.1.0

### New features

- Added authentication to prometheus ingress

# Sensa Helm Chart 1.3.4 Release Notes (2023-02-15)

## Significant Changes

### Configurations added and updated

- change trino configmap-catalog to use variables for minio user

### Images have been updated

- hades has been updated to v3.0.4
- hermes has been updated to v3.0.2
- kafka has been updated to 3.3.2-debian-11-r0
- kube-prometheus has been updated to 0.61.1-debian-11-r9
- meillisearch has been updated to v0.30.5
- minio has been updated to 2023.1.31-debian-11-r0
- postgres has been updated to 15.1.0-debian-11-r30
- redis has been updated to 7.0.8-debian-11-r0
- trino has been updated to version 405
- web and zeus have been updated to v3.0.0
- Moved trino-coordinator and hive-metastore to separate dockerhub repos

## New features

- pre-upgrade hook added to cleanup old service and deployment names
- post-install hook added to create initial Sensa admin, minio user, and minio bucket
- Moved creation of datalake user's password into trino template using password from global-values.yaml
- Expose prometheus endpoint via ingress
