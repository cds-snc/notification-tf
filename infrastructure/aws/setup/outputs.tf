output "ses_verification_token" {
  value = format("\"%s\"", aws_ses_domain_identity.ses_domain.verification_token)
}