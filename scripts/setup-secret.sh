# This script should run before the helm chart. This will create the namespace that we are going to be
# running postgres within and creating a secret within that namespace.
read -p "Enter k8s namespace (postgres):" postgres_namespace
postgres_namespace=${postgres_namespace:-postgres}
read -p "Enter secret name (postgres-secret):" postgres_secret_name
postgres_secret_name=${postgres_secret_name:-postgres-secret}
read -p "Enter POSTGRES_USER (admin): " postgres_user
postgres_user=${postgres_user:-admin}
read -s -p "Enter POSTGRES_PASSWORD (random): " postgres_password
echo ""
if [[ -z "$postgres_password" ]]; then
  postgres_password=$(openssl rand -base64 20)
  echo "Password generated, please read from secret to use!"
fi

echo ""
echo "Setting up namespace $postgres_namespace"
# We could use kubectl create if we want, but it is not idempotent so this way is preferable
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: $postgres_namespace
EOF

echo "Creating secret named $postgres_secret_name"
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  namespace: $postgres_namespace
  name: $postgres_secret_name
data:
  POSTGRES_USER: $(echo -n $postgres_user | base64 -w0)
  POSTGRES_PASSWORD: $(echo -n $postgres_password | base64 -w0)
EOF
