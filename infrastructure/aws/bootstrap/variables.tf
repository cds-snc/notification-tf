variable account_id {
  description = "(Required) The account ID to perform actions on."
  type        = string
}

variable domain {
  description = "(Required) Specify the Service Domain."
  type        = string
}

variable rds_password {
  description = "RDS password"
  type        = string
}

variable name {
  description = "Service name"
  type        = string
}

variable "region" {
  description = "(Required) Your AWS region"
}

variable "snapshot" {
  description = "(Optional) A RDS snapshot"
}