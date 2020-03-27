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