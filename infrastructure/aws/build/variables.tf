variable domain {
  description = "(Required) Specify the Service Domain."
  default     = "notification.canada.ca"
  type        = string
}

variable name {
  description = "(Required) Specify the Service Name."
  default     = "notification-canada-ca"
  type        = string
}

variable rds_password {
  description = "RDS password"
  default     = "notification-canada-ca"
  type        = string
}