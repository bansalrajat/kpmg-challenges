provider "aws" {
  region = var.region
  }

terraform {
  backend "s3" {}
  }

module "networking" {
  source                = "./modules/networking"
  vpc_cidr              = var.vpc_cidr
  public_subnet_b_cidr  = var.public_subnet_b_cidr
  public_subnet_b_az = var.public_subnet_b_az
  
  public_subnet_c_cidr  = var.public_subnet_c_cidr
  public_subnet_c_az = var.public_subnet_c_az
  private_subnet_b_cidr = var.private_subnet_b_cidr
  private_subnet_b_az = var.private_subnet_b_az

   private_subnet_c_cidr = var.private_subnet_c_cidr
   private_subnet_c_az = var.private_subnet_c_az

   db_subnet_b_cidr      = var.db_subnet_b_cidr
   db_subnet_b_az = var.db_subnet_b_az
  db_subnet_c_cidr      = var.db_subnet_c_cidr
  db_subnet_c_az = var.db_subnet_c_az
  
  
}

module "web" {
    source = "./modules/web"
    
    public_subnet_b  = module.networking.public_subnet_b
    public_subnet_c  = module.networking.public_subnet_c
    private_subnet_b = module.networking.private_subnet_b
    private_subnet_c = module.networking.private_subnet_c
    public_sg        = module.networking.public_sg
    private_sg       = module.networking.private_sg
    ami_image_id = var.ami_image_id
    main_vpc = module.networking.main_vpc
}

module "db" {
  source              = "./modules/db"
  db_subnet_b         = module.networking.db_subnet_b
  db_subnet_c         = module.networking.db_subnet_c
  db_security_group   = module.networking.private_sg
  username            = var.username
  password            = var.password
  instance_class      = var.instance_class
  multi_az            = var.multi_az
  allocated_storage   = var.allocated_storage
  skip_final_snapshot = var.skip_final_snapshot
}