aws-bootstrap:
	cd aws/bootstrap &&\
	terraform init &&\
	terraform plan &&\
	terraform apply &&\
	terraform output > ../backend.tfvars

aws-apply:
	cd aws &&\
	terraform init -backend-config=backend.tfvars &&\
	terraform plan &&\
	terraform apply