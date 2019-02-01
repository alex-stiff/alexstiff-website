# alexstiff-website

## Initial set up

Create a file `secret.tfvars` containing AWS secret key and access key:
```
# secret.tfvars
access_key = "AWSACCESSKEY"

secret_key = "MYSECRETAWSSECRETKEY"
```
Initialise  and provision the S3 backend from the `s3-backend` directory, which consists of S3 bucket for storage and DynamoDB for remote state locking.
```
cd s3-backend
terraform init
terraform apply -var-file=../secret.tfvars
cd -
```

Initialise everything else.
```
terraform init -backend-config=secret.tfvars
```

Update all resources.
```
terraform apply -var-file=secret.tfvars
```