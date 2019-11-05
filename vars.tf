######################
# Global Variable #
######################

variable "aws_region" {
  type        = "string"
  description = "AWS region these resource to be created"
  default     = "us-east-1"
}

/*
variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.1.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default = "10.1.0.0/24"
}

variable "availability_zone" {
  description = "availability zone to create subnet"
  default = "us-east-1a"
}
*/

variable "public_key_path" {
  description = "Public key path"
  default = "terraform-user.pub"
}


# common tags for all aws resources SG ECR ECS & ELB
variable aws_rsrc_tags {
    type        = "map"
    description = "Common Tags that need to be attached to AWS Resources"
    default     = {
      Builder         = "Kashif Hasan"
      Environment     = "Test"
      Program         = "SedinTechnology"
      Purpose         = "Sample Infrastructure"
    }
}

