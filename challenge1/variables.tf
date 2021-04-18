variable "region"{
    type = string
    default = "eu-west-2"
}
variable "vpc_cidr" {

  type        = string
}

variable "public_subnet_b_cidr" {

  type        = string
}

variable "public_subnet_b_az" {
  
}

variable "public_subnet_c_az" {
  
}

variable "private_subnet_b_az" {
  
}
variable "private_subnet_c_az" {
  
}

variable "public_subnet_c_cidr" {
  }

variable "private_subnet_b_cidr" {
  }

variable "private_subnet_c_cidr" {
  }

variable "db_subnet_b_cidr" {
  }

variable "db_subnet_c_cidr" {
  }

variable "db_subnet_b_az" {
  }

variable "db_subnet_c_az" {
  }

variable "username" {
  }

variable "password" {
 }

variable "instance_class" {

}

variable "multi_az" {

}

variable "allocated_storage" {

}

variable "skip_final_snapshot" {

}

variable "ami_image_id" {
  
}
