resource "local_file" "instructions" {
    content     = <<EOF
        Please add the following CNAME records to your DNS to validate the SSL certs:
        
        For ${aws_acm_certificate.notification-canada-ca.domain_name}
        - Name: ${aws_acm_certificate.notification-canada-ca.domain_validation_options.0.resource_record_name}
        - Type: ${aws_acm_certificate.notification-canada-ca.domain_validation_options.0.resource_record_type}
        - Value: ${aws_acm_certificate.notification-canada-ca.domain_validation_options.0.resource_record_value}

        For ${aws_acm_certificate.wildcard-notification-canada-ca.domain_name}
        - Name: ${aws_acm_certificate.wildcard-notification-canada-ca.domain_validation_options.0.resource_record_name}
        - Type: ${aws_acm_certificate.wildcard-notification-canada-ca.domain_validation_options.0.resource_record_type}
        - Value: ${aws_acm_certificate.wildcard-notification-canada-ca.domain_validation_options.0.resource_record_value}

        Please add the following records to your DNS to validate the SES domain:
        
        For ${aws_ses_domain_identity.ses_domain.domain}
        - Name: _amazonses.example.com
        - Type: TXT
        - Value: ${aws_ses_domain_identity.ses_domain.verification_token}


        Please add the following records to your DNS to validate the A records:
        
        For ${aws_acm_certificate.notification-canada-ca.domain_name}
        - Name: ${aws_acm_certificate.notification-canada-ca.domain_name}
        - Type: A
        - Value: ${aws_alb.notification-canada-ca.dns_name}

        For ${aws_acm_certificate.wildcard-notification-canada-ca.domain_name}
        - Name: ${aws_acm_certificate.wildcard-notification-canada-ca.domain_name}
        - Type: A
        - Value: ${aws_alb.notification-canada-ca.dns_name}


    EOF
    filename = "../../../instructions.txt"
}