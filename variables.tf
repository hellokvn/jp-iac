variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "access_ip" {
  type = string
}

variable "dbname" {
  type = string
}

variable "dbuser" {
  type      = string
  sensitive = true
}

variable "dbpassword" {
  type      = string
  sensitive = true
}

variable "email" {
  type = string
}

variable "domain" {
  type    = string
  default = "fivehy.com"
}

variable "s3_domain" {
  type    = string
  default = "jp.fivehy.com"
}

variable "api_domain" {
  type    = string
  default = "api.fivehy.com"
}

