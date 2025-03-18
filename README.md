### Helm Chart: Sensa

This Helm chart deploys Sensa. This document describes the configurable options available in the values.yaml file.

## Prerequisites

Kubernetes 1.25+<br>
Helm 3.0+<br>
istio 1.18+<br>
nginx (default) or haproxy ingress controller

## Installing the Chart
To install the chart with the release name sensa:
```
helm install -n sensa sensa symphonyfs/sensa -f global-values.yaml
```
## Uninstalling the Chart
To uninstall/delete the sensa deployment:
```
helm uninstall -n sensa sensa
```
The command removes all the Kubernetes components associated with the chart, except PVCs and deletes the release.  To delete the PVCs:
```
kubectl -n sensa delete pvc --all
```
## Configuration

The following table lists the configurable parameters of the chart and their default values.

| Parameter                                          | Description                                                        | Default                                                |
| :-------------------------------------------------- | :----------------------------------------------------------------- | :----------------------------------------------------- |
| `tags.adminer-install`                             | Install Adminer component                                          | `false`                                                |
| `tags.prometheus-install`                          | Install Prometheus component                                       | `true`                                                 |
| `tags.kafka-install`                               | Install Kafka component                                            | `false`                                                |
| `tags.rabbitmq-install`                            | Install RabbitMQ component                                         | `false`                                                |
| `tags.wlm-install`                                 | Install WLM component                                              | `true`                                                 |
| `hades.fullnameOverride`                           | Override the full name of the Hades component                       | `"hades"`                                              |
| `hades.image.tag`                                  | Hades image tag                                                    | `"v4.3.2"`                                             |
| `hades.imagePullSecrets[0].name`                   | Hades image pull secret                                            | `"regcred"`                                            |
| `hermes.fullnameOverride`                          | Override the full name of the Hermes component                      | `"hermes"`                                             |
| `hermes.image.tag`                                 | Hermes image tag                                                   | `"v4.3.2"`                                             |
| `hermes.imagePullSecrets[0].name`                  | Hermes image pull secret                                           | `"regcred"`                                            |
| `hive-metastore.fullnameOverride`                  | Override the full name of the Hive Metastore component              | `"hive-metastore"`                                     |
| `hive-metastore.image.tag`                         | Hive Metastore image tag                                           | `"v4.5.0"`                                             |
| `hive-metastore.imagePullSecrets[0].name`          | Hive Metastore image pull secret                                   | `"regcred"`                                            |
| `kafka.fullnameOverride`                           | Override the full name of the Kafka component                       | `"broker"`                                             |
| `kafka.kraft.enabled`                              | Enable Kafka KRaft mode                                            | `false`                                                |
| `kafka.zookeeper.enabled`                          | Enable Zookeeper                                                   | `true`                                                 |
| `kafka.metrics.jmx.enabled`                        | Enable Kafka JMX metrics                                           | `true`                                                 |
| `kafka.metrics.kafka.enabled`                      | Enable Kafka metrics                                               | `true`                                                 |
| `kafka.broker.replicaCount`                        | Number of Kafka brokers                                            | `1`                                                    |
| `kafka.controller.replicaCount`                    | Number of Kafka controllers                                        | `0`                                                    |
| `kafka.listeners.client.protocol`                  | Protocol for Kafka client listeners                                | `PLAINTEXT`                                            |
| `kafka.listeners.controller.protocol`              | Protocol for Kafka controller listeners                            | `PLAINTEXT`                                            |
| `kafka.listeners.interbroker.protocol`             | Protocol for Kafka inter-broker listeners                          | `PLAINTEXT`                                            |
| `kafka.listeners.external.protocol`                | Protocol for Kafka external listeners                              | `PLAINTEXT`                                            |
| `kube-prometheus.fullnameOverride`                 | Override the full name of the Prometheus component                  | `"prometheus"`                                         |
| `kube-prometheus.prometheus.additionalScrapeConfigs.enabled` | Enable additional scrape configs for Prometheus          | `true`                                                 |
| `kube-prometheus.prometheus.additionalScrapeConfigs.type`    | Type of additional scrape configs for Prometheus        | `internal`                                             |
| `minio.fullnameOverride`                           | Override the full name of the MinIO component                       | `"minio"`                                              |
| `minio.mode`                                       | MinIO deployment mode (standalone or distributed)                  | `distributed`                                          |
| `minio.auth.existingSecret`                        | Name of the existing secret for MinIO authentication               | `"minio-creds"`                                        |
| `minio.persistence.size`                           | Persistent storage size for MinIO                                   | `500Gi`                                                |
| `minio.podAnnotations.prometheus.io/scrape`        | Enable scraping of MinIO metrics by Prometheus                     | `"true"`                                               |
| `minio.podAnnotations.prometheus.io/path`          | Path to MinIO metrics                                              | `"/minio/v2/metrics/cluster"`                          |
| `minio.podAnnotations.prometheus.io/port`          | Port for MinIO metrics                                             | `"9000"`                                               |
| `postgresql.fullnameOverride`                      | Override the full name of the PostgreSQL component                  | `"postgres"`                                           |
| `postgresql.global.postgresql.auth.username`       | PostgreSQL username                                                | `"ayasdi"`                                             |
| `postgresql.global.postgresql.auth.database`       | PostgreSQL database name                                           | `"ayasdi"`                                             |
| `postgresql.global.postgresql.auth.existingSecret` | Name of the existing secret for PostgreSQL authentication          | `"postgres-creds"`                                     |
| `postgresql.metrics.enabled`                       | Enable PostgreSQL metrics                                          | `true`                                                 |
| `postgresql.primary.persistence.size`              | Persistent storage size for PostgreSQL                              | `100Gi`                                                |
| `postgresql.primary.extendedConfiguration`         | Extended configuration for PostgreSQL                              | `"max_connections = 500"`                              |
| `rabbitmq.fullnameOverride`                        | Override the full name of the RabbitMQ component                    | `"rabbitmq"`                                           |
| `rabbitmq.auth.existingPasswordSecret`             | Name of the existing secret for RabbitMQ password                  | `"rabbitmq-creds"`                                     |
| `rabbitmq.auth.existingErlangSecret`               | Name of the existing secret for RabbitMQ Erlang cookie             | `"rabbitmq-creds"`                                     |
| `rabbitmq.metrics.enabled`                         | Enable RabbitMQ metrics                                            | `true`                                                 |
| `rabbitmq.persistence.size`                        | Persistent storage size for RabbitMQ                                | `8Gi`                                                  |
| `redis.fullnameOverride`                           | Override the full name of the Redis component                       | `"redis"`                                              |
| `redis.auth.existingSecret`                        | Name of the existing secret for Redis authentication               | `"redis-creds"`                                        |
| `redis.auth.existingSecretPasswordKey`             | Key in the secret for Redis password                               | `"password"`                                           |
| `redis.commonConfiguration`                        | Common Redis configuration options                                 | `"appendonly no\nsave \"\""`                           |
| `redis.metrics.enabled`                            | Enable Redis metrics                                               | `true`                                                 |
| `redis.master.disableCommands`                     | Redis commands to disable                                          | `["FLUSHALL"]`                                         |
| `sensa-hooks.fullnameOverride`                     | Override the full name of the Sensa Hooks component                 | `"hyperkube"`                                          |
| `sensa-hooks.image.tag`                            | Sensa Hooks image tag                                              | `"v4.5.9"`                                            |
| `sensa-hooks.imagePullSecrets[0].name`             | Sensa Hooks image pull secret                                      | `"regcred"`                                            |
| `sensa-hooks.imagePullSecrets[1].name`             | Additional image pull secret for Sensa Hooks                       | `"azure-regcred"`                                      |
| `sensa-hooks.sensaSecrets`                         | Name of the Sensa global secrets                                   | `"sensa-global-secrets"`                               |
| `sensa-hooks.tempSecrets`                          | Name of the temporary secrets for Sensa Hooks                      | `"sensa-temp-secrets"`                                 |
| `styx.fullnameOverride`                            | Override the full name of the Styx component                        | `"styx"`                                               |
| `styx.image.tag`                                   | Styx image tag                                                     | `"v4.4.0"`                                             |
| `styx.imagePullSecrets[0].name`                    | Styx image pull secret                                             | `"regcred"`                                            |
| `trino.fullnameOverride`                           | Override the full name of the Trino component                       | `"trino"`                                              |
| `trino.image.tag`                                  | Trino image tag                                                    | `"462"`                                                |
| `trino.accessControl.type`                         | Type of access control for Trino                                    | `configmap`                                            |
| `trino.accessControl.refreshPeriod`                | Refresh period for access control                                  | `60s`                                                  |
| `trino.additionalConfigProperties[0]`              | Additional Trino config: process forwarded requests                | `"http-server.process-forwarded=true"`                 |
| `trino.additionalConfigProperties[1]`              | Additional Trino config: authentication type                       | `"http-server.authentication.type=PASSWORD"`           |
| `trino.additionalConfigProperties[2]`              | Additional Trino config: shared secret                             | `"internal-communication.shared-secret=trino-creds"`   |
| `trino.server.workers`                             | Number of Trino workers                                            | `6`                                                    |
| `trino.server.config.authenticationType`           | Trino authentication type                                          | `"PASSWORD"`                                           |
| `trino.server.config.query.maxMemory`              | Maximum query memory for Trino                                     | `"300GB"`                                              |
| `trino.server.config.query.maxMemoryPerNode`       | Maximum query memory per node for Trino                            | `"20GB"`                                               |
| `trino.server.config.memory.heapHeadroomPerNode`   | Heap headroom per node for Trino                                   | `"4GB"`                                                |
| `trino.coordinator.jvm.maxHeapSize`                | Maximum JVM heap size for Trino coordinator                        | `"25G"`                                                |
| `trino.worker.jvm.maxHeapSize`                     | Maximum JVM heap size for Trino worker                             | `"25G"`                                                |
| `trino.worker.resources.requests.cpu`              | CPU request for Trino worker                                       | `"6000m"`                                              |
| `trino.worker.resources.requests.memory`           | Memory request for Trino worker                                    | `"32Gi"`                                               |
| `trino.serviceMonitor.enabled`                     | Enable Prometheus service monitor for Trino                         | `true`                                                 |
| `web.fullnameOverride`                             | Override the full name of the Web component                         | `"web"`                                                |
| `web.image.tag`                                    | Web component image tag                                            | `"v4.5.0"`                                             |
| `web.imagePullSecrets[0].name`                     | Web component image pull secret                                    | `"regcred"`                                            |
| `wlm.fullnameOverride`                             | Override the full name of the WLM component                         | `"wlm"`                                                |
| `wlm.image.tag`                                    | WLM component image tag                                            | `"v1.0.0-a4"`                                          |
| `wlm.imagePullSecrets[0].name`                     | WLM component image pull secret                                    | `"regcred"`                                             |
| `zeus.fullnameOverride`                            | Override the full name of the API component                         | `"zeus"`                                                |
| `zeus.image.tag`                                    | API component image tag                                            | `"v4.5.0"`                                            |
| `zeus.imagePullSecrets[0].name`                     | API component image pull secret                                    | `"regcred"`                                             |
| `global.AYASDI_SENTRY_SAMPLE_RATE`     | Sentry sample rate                                    | `""`                                                      |
| `global.DATALAKE_USER`                 | Datalake user                                         | `"sensa"`                                                 |
| `global.DATALAKE_SERVICE_USER`         | Datalake service user                                 | `"service"`                                               |
| `global.DB_TYPE`                       | Database type                                         | `"postgres"`                                              |
| `global.DB_PORT`                       | Database port                                         | `"5432"`                                                  |
| `global.DB_USER`                       | Database user                                         | `"ayasdi"`                                                |
| `global.HIVE_USER`                     | Hive metastore user                                   | `"hive"`                                                  |
| `global.HERMES_FILE_SCAN_FREQUENCY_MINUTES` | Frequency in minutes for Hermes file scan        | `1`                                                       |
| `global.ingress_type`                  | Ingress controller type                               | `"nginx"`                                                 |
| `global.MINIO_BACKUP_FOLDER`           | MinIO backup folder                                   | `"backups"`                                               |
| `global.MINIO_UPLOAD_USER`             | MinIO upload user                                     | `"landing"`                                               |
| `global.MINIO_USER`                    | MinIO root user                                       | `"minio"`                                                 |
| `global.NODE_ENV`                      | Node environment                                      | `"production"`                                            |
| `global.PIPELINE_FAMILIES_BUCKET`      | Pipeline families bucket                              | `"pipeline-families"`                                     |
| `global.PIPELINE_DISCOVERY_BUCKET`     | Pipeline discovery bucket                             | `"pipeline-landing-zone"`                                 |
| `global.REDIS_INDEX_API`               | Redis index for API                                   | `1`                                                       |
| `global.REDIS_INDEX_HADES`             | Redis index for Hades                                 | `2`                                                       |
| `global.REDIS_INDEX_HERMES`            | Redis index for Hermes                                | `3`                                                       |
| `global.REDIS_INDEX_STYX`              | Redis index for Styx                                  | `4`                                                       |
| `global.SENSA_API_DOCS`                | Enable Sensa API documentation                        | `false`                                                   |
| `global.SENSA_API_URL`                 | Sensa API URL                                         | `"http://zeus:3001"`                                      |
| `global.SENSA_BATCH_SIZE`              | Batch size for Sensa                                  | `100000`                                                  |
| `global.SENSA_EMAIL`                   | Sensa service email                                   | `"service@ayasdi.io"`                                     |
| `global.SENSA_HERMES_URL`              | Sensa Hermes URL                                      | `"http://hermes:5004"`                                    |
| `global.SENSA_KAFKA_URL`               | Sensa Kafka URL                                       | `"broker:9092"`                                           |
| `global.SENSA_KUBEFLOW_URL`            | Sensa Kubeflow URL                                    | `"http://ml-pipeline-ui.kubeflow.svc.cluster.local:80"`   |
| `global.SENSA_LOADER_URL`              | Sensa Loader URL                                      | `"http://atlas:5000"`                                     |
| `global.SENSA_PROMETHEUS_URL`          | Sensa Prometheus URL                                  | `"http://prometheus:9090"`                                |
| `global.SENSA_RABBIT_MQ_STYX_QUEUE`    | Sensa RabbitMQ Styx queue                             | `""`                                                      |
| `global.SENSA_RULE_ENGINE_URL`         | Sensa Rule Engine URL                                 | `"http://hades:5003"`                                     |
| `global.SENSA_SEARCH_URL`              | Sensa Search URL                                      | `"http://meilisearch:7700"`                               |
| `global.SENSA_STYX_URL`                | Sensa Styx URL                                        | `"http://styx:3007"`                                      |
| `global.SSL_SECRETS`                   | SSL secrets                                           | `"https-certs"`                                           |
| `global.STYX_BUCKET_NAME`              | Styx bucket name                                      | `"config"`                                                |
| `global.STYX_OBJECT_NAME`              | Styx config file name                                 | `"mappings.yml"`                                          |
| `global.STYX_CONCURRENT_BATCH_LIMIT`   | Styx concurrent batch limit                           | `4`                                                       |
| `global.sslPort`                       | SSL port                                              | `443`                                                     |
| `global.KFsslPort`                     | Kubeflow SSL port                                     | `443`                                                     |
| `global.internal_ca`                   | For use with internal Certificate Authorities         | `false`                                                   |
| `global.proxy_server`                  | FQDN or IP of proxy server                            | `""`                                                      |
| `global.proxy_port`                    | TCP port of proxy server                              | `""`                                                      |

## Additional Information

Security Context: Security context settings are enabled by default. You can customize these based on your environment.

Persistence: Several components have persistent storage enabled by default. Ensure you have adequate storage resources before deploying.

Monitoring: Prometheus monitoring is integrated and enabled for various components.

## Advanced Configuration

For more advanced usage, you can override individual configurations by using the --set flag during installation or by providing a custom values.yaml file.

```
helm install -n sensa sensa symphonyfs/sensa --set key1=value1,key2=value2
```