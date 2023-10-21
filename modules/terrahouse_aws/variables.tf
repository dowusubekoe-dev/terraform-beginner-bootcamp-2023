variable "user_uuid" {
  type        = string
  description = "The UUID of the user"
  validation {
    condition     = can(regex("^([a-z0-9.-]+)$", var.user_uuid))
    error_message = "The user_uuid is value is not a valid UUID."
  }
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "Bucket name must be between 3 and 63 characters"
  }
}

variable "index_html_filepath" {
  description = "The file path for index.html"
  type = string

  validation {
  condition = fileexists(var.index_html_filepath)
  error_message = "The provided path for index.html does not exist."
}
}

variable "error_html_filepath" {
  description = "The file path for error.html"
  type = string

  validation {
  condition = fileexists(var.error_html_filepath)
  error_message = "The provided path for error.html does not exist."
  }
}

variable "content_version" {
  description = "The content version. Should be a positive integer strings at 1."
  type = number
  
  validation {
    condition = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "The content_version must be a positive integer starting at 1."
  }
}

