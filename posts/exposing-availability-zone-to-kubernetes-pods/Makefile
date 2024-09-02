# 1. setup k8s cluster with kind
createCluster:
	kind create cluster --config ./kind.cluster.yaml -n opensearch

# 2. use context for k8s cluster
context:
	kubectl config use-context kind-opensearch

# 3. setup opensearch
apply:
	kubectl apply -k ./manifests/
