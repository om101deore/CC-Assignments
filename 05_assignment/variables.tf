variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "EC2_using_Terraform"
}

variable "instance_ami_id" {
    description = "Amazon machine image id"
    type = string
    default ="ami-0914547665e6a707c"
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t3.micro"
}
