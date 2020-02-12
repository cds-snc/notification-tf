data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~>1.10.0"
}

data "aws_availability_zones" "available" {
}

module "eks" {
  source       = "git::https://github.com/terraform-aws-modules/terraform-aws-eks?ref=v8.0.0"

  cluster_name = var.name
  subnets      = module.vpc.private_subnets

  tags = {
    Environment = "production"
  }

  vpc_id = module.vpc.vpc_id

  node_groups_defaults = {
    ami_type  = "AL2_x86_64"
    disk_size = 20
  }

  node_groups = {
    production = {
      desired_capacity = 3
      max_capacity     = 4
      min_capacity     = 2

      instance_type = "m5.large"
      k8s_labels = {
        Environment = "production"
      }
      additional_tags = {
        Group = "true"
        ExtraTag = "production"
      }
    }
  }
}