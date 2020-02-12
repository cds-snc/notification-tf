output "ses_verification" {
  description = "Verification TXT record for SES"
  value       = aws_ses_domain_identity.ses_domain.verification_token
}

output "dkim_verification_token" {
  description = "DKIM CNAME record for SES"
  value       = aws_ses_domain_dkim.ses_domain.dkim_tokens
}

output "naked_acm_verification" {
  description = "Certificate verification CNAME for nakedß"
  value       = aws_acm_certificate.notification-canada-ca.domain_validation_options
}

output "wildcard_acm_verification" {
  description = "Certificate verification CNAME for wildcards"
  value       = aws_acm_certificate.wildcard-notification-canada-ca.domain_validation_options
}

output "alb_domain" {
  description = "ALB A Record"
  value       = aws_alb.notification-canada-ca.dns_name
}