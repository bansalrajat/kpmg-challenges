Update the backend bucket in config

Go to  backend-bucket directory and execute the commands as mentioned to create bucket for state files.

To Create and Environment , Execute 

tf workspace new <Environment Name>

tf init  -backend-config=config/s3-backend.config -backend=true -var-file

terraform plan -var-file=config/<Environment Name>.tfvars -lock=true

terraform apply -var-file=config/<Environment Name>.tfvars -lock=true
