variable "users" {
  description = "Users to map"
  type        = map(string)
}

variable "cf_zone" {
  description = "Cloudflare Zone ID"
  type        = string
}
