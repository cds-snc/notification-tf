# Notification Terraform

## Deploying on AWS

1. Add a `credentials` file to the `aws/` directory that includes AWS credentials. The file should look like this:

```
[default]
aws_access_key_id=[KEY]
aws_secret_access_key=[SECRET]
```

2. Adjust `aws/bootstrap/variables.tf` if needed and run `make aws-bootstrap` to deploy the Terraform storage backend.

3. Adjust `aws/variables.tf` if needed and `make aws-deploy` to deploy the infrastructure needed for the project.