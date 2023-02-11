# This script should run before the helm chart. This will create the namespace that we are going to be
# running postgres within and creating a secret within that namespace.
postgres_namespace = "postgres"
postgres_secret_name = "postgres-secret"

read -p "Enter POSTGRES_USER: " postgres_user
read -s -p "Enter POSTGRES_PASSWORD: " posgres_password

echo "Setting up namespace $postgres_namespace"
kubectl create namespace $postgres_namespace

echo "Creating secret named $postgres_secret_name"

