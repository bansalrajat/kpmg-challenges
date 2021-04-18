vpc_cidr              = "10.1.0.0/16"
public_subnet_b_cidr  = "10.1.1.0/24"
public_subnet_b_az    = "eu-west-2b"

public_subnet_c_cidr  = "10.1.2.0/24"
public_subnet_c_az    = "eu-west-2c" 

private_subnet_b_cidr = "10.1.3.0/24"
private_subnet_b_az = "eu-west-2b"

private_subnet_c_cidr = "10.1.4.0/24"
private_subnet_c_az = "eu-west-2c"

db_subnet_b_cidr      = "10.1.5.0/24"
db_subnet_b_az    = "eu-west-2b" 

db_subnet_c_cidr      = "10.1.6.0/24"
db_subnet_c_az    = "eu-west-2c" 

ami_image_id = "ami-0fbec3e0504ee1970"

username              = "foo"
instance_class        = "db.t2.micro"
multi_az              = "false"
allocated_storage     = "10"
skip_final_snapshot   = "true"