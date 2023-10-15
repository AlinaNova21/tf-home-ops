variable "name" {
  type    = string
  default = ""
}

variable "api_url" {
  type = string
}

variable "api_key" {
  type      = string
  sensitive = true
}

variable "discord_web_hook_url" {
  type      = string
  sensitive = true
}
