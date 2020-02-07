aws-bootstrap:
	cd infrastructure/aws/bootstrap &&\
	terraform init &&\
	terraform plan &&\
	terraform apply &&\
	terraform output > ../build/backend.tfvars

aws-build:
	cd infrastructure/aws/build &&\
	terraform init -backend-config=backend.tfvars &&\
	terraform plan &&\
	terraform apply

aws-config:
	KUBECONFIG=~/.kube/config:./infrastructure/aws/build/kubeconfig_notification-canada-ca kubectl config view --flatten > mergedkub && mv mergedkub ~/.kube/config &&\
	kubectl config use-context eks_notification-canada-ca

eks: 
	kubectl apply -k manifests/overlays/eks

kustomize:
	kubectl kustomize manifests/overlays/eks