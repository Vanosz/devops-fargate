variable "project_name" {
  type        = string
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  type        = list(string)
  description = "cidr blocks for public subnets"
}

variable "azs" {
  type        = list(string)
  description = "az for subnets"
}
