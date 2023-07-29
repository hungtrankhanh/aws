terraform {
    backend "s3" {
        bucket = "udacity-terraform-backup"
        key = "backup/terraform.tfstate" 
        region = "us-east-1"
		access_key = "AKIA2IMV72H2R566RNZD"
		secret_key = "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"
    }
}