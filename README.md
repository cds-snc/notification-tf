# Notification Deployment

## Deploying on AWS

This is a six step deployment. The first three steps include building your base infrastructure in AWS. Step four is provisioning a kubernetes cluster. Step five is deploying the application using kubernetes manifest files. You will need the following executables:

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

3. Adjust `aws/variables.tf` if needed and `make aws-build` to deploy the infrastructure needed for the project.

4. Adjust the variables in `manifests/overlays/eks/.env`. A sample of the information required is in `env.example`

5. Run `make aws-eks` to deploy the cluster.
  
6. Complete the following manual tasks in the AWS account:
- [] Request an increase in spending for SNS SMS messages
- [] Request to be removed from the SES sandbox
- [] Use the ALB A name to re-map the DNS
- [] Uncomment the aws_sns_topic_subscription in `sns.tf` and run `make aws-build` again.
- [] Ensure that SNS SMS message limit is applied in account