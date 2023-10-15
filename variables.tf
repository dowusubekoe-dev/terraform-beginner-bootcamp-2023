variable "user_uuid" {
  type        = string
  description = "The UUID of the user"

  validation {
    condition     = can(regex("^([a-z0-9.-]+)$", var.user_uuid))
    error_message = "The user_uuid is value is not correct"
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



