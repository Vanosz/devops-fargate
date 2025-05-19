variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "nginx-app"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"] # us-east-1a us-east-1b
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}
