variable "aws_region" {
  description = "AWS region for the demonstration environment."
  type        = string
  default     = "ap-southeast-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones used by the VPC."
  type        = list(string)

  default = [
    "ap-southeast-1a",
    "ap-southeast-1b"
  ]

  validation {
    condition     = length(var.availability_zones) == 2
    error_message = "Exactly two Availability Zones must be specified."
  }
}

variable "project_name" {
  description = "Name used for identifying project resources."
  type        = string
  default     = "cicd-demo-oyls"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Project name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "github_owner" {
  description = "GitHub repository owner."
  type        = string
  default     = "oyls03"
}

variable "github_repository" {
  description = "GitHub repository containing the CI/CD workflows."
  type        = string
  default     = "aws-cicd-demo"
}

variable "github_branch" {
  description = "GitHub branch permitted to assume the deployment role."
  type        = string
  default     = "main"
}
