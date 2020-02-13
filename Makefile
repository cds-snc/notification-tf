aws-bootstrap:
	cd infrastructure/aws/bootstrap &&\
	terraform init &&\
	terraform plan -var-file=../../../vars.tfvars &&\
	terraform apply -var-file=../../../vars.tfvars &&\
	terraform output > ../build/backend.tfvars

aws-bootstrap-remove:
	cd infrastructure/aws/bootstrap &&\
	terraform destroy -var-file=../../../vars.tfvars

aws-build:
	cd infrastructure/aws/build &&\
	terraform init -backend-config=backend.tfvars &&\
	terraform plan -var-file=../../../vars.tfvars &&\
	terraform apply -var-file=../../../vars.tfvars

aws-build-remove:
	cd infrastructure/aws/build &&\
	terraform destroy -var-file=../../../vars.tfvars

aws-setup:
	cd infrastructure/aws/setup &&\
	terraform init -backend-config=backend.tfvars &&\
	terraform plan -var-file=../../../vars.tfvars &&\
	terraform apply -var-file=../../../vars.tfvars

aws-setup-remove:
	cd infrastructure/aws/setup &&\
	terraform destroy -var-file=../../../vars.tfvars

aws-config:
	KUBECONFIG=~/.kube/config:./infrastructure/aws/build/kubeconfig_notifcation-prod-2020-02-12 kubectl config view --flatten > mergedkub && mv mergedkub ~/.kube/config

eks: 
	kubectl apply -k manifests/overlays/eks

kustomize:
	kubectl kustomize manifests/overlays/eks