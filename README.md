# Notification Deployment

## Deploying on AWS

This is a siz step deployment. The first three steps include building your base infrastructure in AWS. Step four is provisioning a kubernetes cluster. Step five is deploying the application using kubernetes manifest files. You will need the following executables:

- terraform
- eksctl
- kubectl (version 3)

1. Add a `credentials` file to the `aws/` directory that includes AWS credentials. The file should look like this:

```
[default]
aws_access_key_id=[KEY]
aws_secret_access_key=[SECRET]
```

2. Adjust `aws/bootstrap/variables.tf` if needed and run `make aws-bootstrap` to deploy the Terraform storage backend.

3. Adjust `aws/variables.tf` if needed and `make aws-deploy` to deploy the infrastructure needed for the project.

4. Next create a kubernetes cluster in AWS. You can make changes to how the cluster is set up in `aws/eksctl.yaml`.  Run `make aws-eks`. You may need to wait up to 20 minutes.

## To Document

- Adjusting config maps
- SNS callback
- SES validation
- CNAME configuration (Traefik restart)
- Backing up the persistant volumes
- Required IAM permissions
- Outputting kustomize props file from output