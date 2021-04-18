# Challenge 1

A 3 tier environment is a common setup. Use a tool of your choosing/familiarity create these resources

## Prerequisite

Terraform Version
```
$ terraform version
Terraform v0.14.6
```


## Steps 

Update the backend bucket in file `config/s3-backend.config`

Go to  backend-bucket directory and execute the commands as mentioned to create bucket for state files.

```
$ cd backend-bucket
$ tf plan -var-file=../config/s3-backend.config
$ tf apply -var-file=../config/s3-backend.config -auto-approve
```


To Create an Environment/Workspace , Execute 

```
$ tf workspace new <Environment Name>
```
where `<Environment Name>` will be the new workspace for using the same modules.


Create a seperate file in directory `config` with the same name as `<Environment Name>` and update all the parameters as per environment details.

Initiliaze terraform modules

```
$ tf init  -backend-config=config/s3-backend.config -backend=true -var-file
```

Plan and Verify 
```
$ terraform plan -var-file=config/<Environment Name>.tfvars -lock=true
```

Apply 
```
$ terraform apply -var-file=config/<Environment Name>.tfvars -lock=true
```

Access the url printed the end.
Sample:
```
.
.
.
module.web.aws_lb_listener.http: Modifications complete after 0s [id=arn:aws:elasticloadbalancing:eu-west-2:942082388564:listener/app/dev-lb/914c52c1af9748ba/7673e2fdfe50f25a]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

Outputs:

lb_url = "http://dev-lb-595004083.eu-west-2.elb.amazonaws.com/"

```





Destroy
```
$ terraform destroy -var-file=config/<Environment Name>.tfvars -lock=true

```

