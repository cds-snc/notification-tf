# Notification Deployment

Please refer to the information in the CDS secrets vault on how to access the cluster.

## Deployment notes 

The current production cluster was deployed using eksctl using the `eksctl.yaml` file.

`eksctl create cluster --config-file=eksctl.yaml`

Manifest files were applied by running `make eks` after the cluster was deployed.

The following pieces of AWS infrastructure were manually added:

- RDS Database
- Required S3 buckets (Assets, Documents, CSV)
- SES sending identity
- SNS (SMS) sending abilities
- ALB loadbalancer
- ACM certificates
- SES callback into an SNS topic -> Notify API Endpoint
- DNS records in Route53 
- Cloudwatch alerts

All these have been standardized into terraform and will be available with the next major release.


## Editing production ENV variables

1. Ensure you have the correct AWS credentials in `~/.aws/credentials`.

2. In `manifests/overlays/eks` is an encrypted `.env.enc.aws` file that you can decrypt with AWS using: 

```
aws kms decrypt --ciphertext-blob fileb://.env.enc.aws --output text --query Plaintext --region us-east-1 | base64 --decode > .env
```

3. Make the required changes to `.env`

4. Re-encrypt the file and push to master

```
aws kms encrypt --key-id cd99fe45-693e-4139-bf95-b9fe8be1a446 --plaintext fileb://.env --output text --query CiphertextBlob --region us-east-1 | base64 --decode > .env.enc.aws
```