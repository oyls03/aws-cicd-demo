Part 1 — IaC

Terraform is used to define a VPC spanning two availability zones, separate public and private subnets. Public subnets have internet access through an Internet Gateway, and private subnets have no direct internet route.

An S3 bucket is included for application/artifact storage. Versioning, server-side encryption, bucket ownership controls and public access blocking are enabled to reduce the risk of accidental exposure or data loss.

An assumption was made that this portion could also utilize github actions in order to deploy and make changes as and when needed but no actual deployment/implementation was done on AWS.

For CI/CD access, AWS OIDC is used rather than storing long-lived AWS credentials in GitHub. The IAM role trust policy is restricted to this repository and the main branch.

The CI/CD role is limited to the AWS resources managed by this Terraform configuration. The policy is kept focused on the networking, S3 and IAM operations required by the deployment.

Networking: aws_vpc.main, public/private aws_subnet.*, aws_internet_gateway.main, and aws_route_table.* provide a two-AZ VPC with isolated private subnets.
S3: aws_s3_bucket.artifacts uses versioning, AES256 encryption, BucketOwnerEnforced ownership and full public-access blocking.
CI/CD: aws_iam_openid_connect_provider.github and aws_iam_role.cicd_deployment use GitHub OIDC. The role trust policy is restricted to the configured repository and branch.
Least privilege: aws_iam_policy.cicd_deployment separates permissions into VpcNetworking, ArtifactBucketCreation, ArtifactBucketManagement and IamManagement SIDs rather than granting administrator access.
Tagging: Resources are tagged with the project, environment and ManagedBy = "Terraform" where applicable.

The configuration is provided as a showcase and has not been deployed to AWS.
