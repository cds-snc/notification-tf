aws-bootstrap:
	cd infrastructure/aws/bootstrap &&\
	terraform init &&\
	terraform plan &&\
	terraform apply &&\
	terraform output > ../backend.tfvars

aws-apply:
	cd infrastructure/aws &&\
	terraform init -backend-config=backend.tfvars &&\
	terraform plan &&\
	terraform apply

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