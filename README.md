I know other helm charts for this already exist, but maybe not the way I want to do them. Just doing some practice with helm and k8s, could be useful in the future.

## 1. Setup secrets configuration
Run `./scripts/setup-scret.sh`, which will ask for the following information. If you just hit enter it will assign default values.
- k8s namespace: What namespace the postgres instance will install under. Defaults to `postgres`.
- postgres secret name: name of the postgres secret. Defaults to `postgres-secret`.
- postgres user: The posgres admin user. Defaults to `admin`.
- postgres password: Password for the postgres admin. If you leave this blank a random password will be genereated so if you need it you'll have to extract it from the secret.

## 2. Deploying the chart

## References
[Docker Hub - official postgres image](https://hub.docker.com/_/postgres/)
[Secrets|Kubernetse](https://kubernetes.io/docs/concepts/configuration/secret/)
[How to Deploy Postgres SQL on Kubernetes](https://phoenixnap.com/kb/postgresql-kubernetes)
