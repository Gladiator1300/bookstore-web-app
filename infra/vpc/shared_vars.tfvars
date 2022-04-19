aws_region   = "us-east-1"
owner        = "Hernandez"
project_name = "bookstore"
environment  = "qa"
vpc_cidr     = "10.78.0.0/16"
subnet_cidrs = {
  public1  = "10.78.23.0/24",
  public2  = "10.78.24.0/24",
  public3  = "10.78.25.0/24",
  private1 = "10.78.26.0/24",
  private2 = "10.78.27.0/24",
  private3 = "10.78.28.0/24"
  database1 = "10.78.29.0/24",
  database2 = "10.78.30.0/24",
  database3 = "10.78.31.0/24"
}

