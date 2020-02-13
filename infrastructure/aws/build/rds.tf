resource "aws_db_subnet_group" "notification-canada-ca" {
  name       = "notification-canada-ca"
  subnet_ids = module.vpc.private_subnets
}

resource "aws_db_instance" "notification-canada-ca" {
    count = var.snapshot != "" ? 0 : 1
    name                        = "notification_api"
    identifier                  = "notification-canada-ca"
    username                    = "postgres"
    password                    = var.rds_password
    port                        = "5432"
    engine                      = "postgres"
    engine_version              = "11.5"
    instance_class              = "db.t3.large"
    allocated_storage           = "20"
    storage_encrypted           = true
    vpc_security_group_ids      = [data.aws_eks_cluster.cluster.vpc_config.0.cluster_security_group_id]
    db_subnet_group_name        = aws_db_subnet_group.notification-canada-ca.name
    multi_az                    = true
    storage_type                = "gp2"
    publicly_accessible         = false
    allow_major_version_upgrade = true
    auto_minor_version_upgrade  = true
    apply_immediately           = true
    maintenance_window          = "sun:02:00-sun:04:00"
    skip_final_snapshot         = false
    copy_tags_to_snapshot       = true
    backup_retention_period     = 7
    backup_window               = "04:00-06:00"
    final_snapshot_identifier   = "notification-canada-ca"
    ca_cert_identifier          = "rds-ca-2019"
}

resource "aws_db_instance" "notification-canada-ca-snapshot" {
    count = var.snapshot != "" ? 1 : 0
    name                        = "notification_api"
    identifier                  = "notification-canada-ca"
    username                    = "postgres"
    password                    = var.rds_password
    port                        = "5432"
    engine                      = "postgres"
    engine_version              = "10.6"
    instance_class              = "db.t3.large"
    allocated_storage           = "20"
    storage_encrypted           = true
    vpc_security_group_ids      = [data.aws_eks_cluster.cluster.vpc_config.0.cluster_security_group_id]
    db_subnet_group_name        = aws_db_subnet_group.notification-canada-ca.name
    multi_az                    = true
    storage_type                = "gp2"
    publicly_accessible         = false
    snapshot_identifier         = var.snapshot
    allow_major_version_upgrade = false
    auto_minor_version_upgrade  = false
    apply_immediately           = true
    maintenance_window          = "sun:02:00-sun:04:00"
    skip_final_snapshot         = false
    copy_tags_to_snapshot       = true
    backup_retention_period     = 7
    backup_window               = "04:00-06:00"
    final_snapshot_identifier   = "notification-canada-ca"
    ca_cert_identifier          = "rds-ca-2019"
    iam_database_authentication_enabled = false
    max_allocated_storage       = 0
}