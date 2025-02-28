deploy.sh
#!/bin/bash
# AWS Deployment Script

# Variables
EC2_INSTANCE="your-ec2-instance-id"
RDS_INSTANCE="your-rds-instance-id"
CLOUDFRONT_DISTRIBUTION="your-cloudfront-distribution-id"

echo "Starting AWS E-Commerce Migration..."

# Deploy application to EC2
echo "Deploying application to EC2..."
scp -r app/ ec2-user@$EC2_INSTANCE:/var/www/html/
ssh ec2-user@$EC2_INSTANCE "sudo systemctl restart apache2"

# Database migration
echo "Updating database schema..."
aws rds modify-db-instance --db-instance-identifier $RDS_INSTANCE --apply-immediately

# CloudFront Cache Invalidation
echo "Clearing CloudFront cache..."
aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION --paths "/*"

echo "Migration and deployment completed successfully!"