aws-bootstrap:
	cd infrastructure/aws/bootstrap &&\
	terraform init &&\
	terraform plan &&\
	terraform apply &&\
	terraform output > ../setup/backend.tfvars

aws-build:
	cd infrastructure/aws/build &&\
	terraform init -backend-config=backend.tfvars &&\
	terraform plan &&\
	terraform apply

aws-config:
	KUBECONFIG=~/.kube/config:./infrastructure/aws/build/kubeconfig_notification-canada-ca kubectl config view --flatten > mergedkub && mv mergedkub ~/.kube/config &&\
	kubectl config use-context eks_notification-canada-ca

aws-eks:
	cd infrastructure/aws &&\
	eksctl create cluster --config-file=eksctl.yaml

aws-delete-eks:
	cd infrastructure/aws &&\
	eksctl delete cluster --config-file=eksctl.yaml

eks: 
	kustomize build manifests/overlays/eks | kubectl apply -f -

delete-eks: 
	kustomize build manifests/overlays/eks | kubectl delete -f -