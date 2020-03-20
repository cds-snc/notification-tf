eks: 
	kubectl apply -k manifests/overlays/eks

kustomize:
	kubectl kustomize manifests/overlays/eks