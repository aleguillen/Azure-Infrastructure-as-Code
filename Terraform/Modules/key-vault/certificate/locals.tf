locals {
  # Determines if the Certificate will be imported if path is specified
  is_cert_imported   = "${length(var.cert_path) > 0 ? true : false}"
}