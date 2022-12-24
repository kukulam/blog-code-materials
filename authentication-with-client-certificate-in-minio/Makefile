# 1. setup k8s cluster with kind
createCluster:
	kind create cluster -n minio

# 2. use context for k8s cluster
context:
	kubectl config use-context kind-minio

# 3. verify current kubectl context
checkContext:
	kubectl config get-contexts

# 4. create namespace for minio deployment
createNamespace:
	kubectl create namespace minio

# 5. install cert-manager, it can take a while
installCertManager:
	kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.10.1/cert-manager.yaml

# 6. deploy minio in k8s cluster, if it fails wait few more minutes, cert-manager can be not ready yet
apply:
	kubectl apply -k ./manifests/

# (optional) delete k8s cluster
deleteCluster:
	kind delete cluster --name minio

# (optional) delete k8s namespace
deleteNamespace:
	kubectl delete namespace minio
