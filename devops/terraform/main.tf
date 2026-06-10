terraform {
  required_version = ">= 1.6.0"
}

resource "null_resource" "synthetic_lab" {
  triggers = {
    project = "swiss-data-ai-engineering-lab"
  }
}
