# AWS Cloud
> AWS cloud projects

## Table of Contents
* [Project 1](#project-1)


## Project 1
Create staging tables and analyzing tables in Redshift, drop all tables if they are existed
$ python create_tables.py 


### VPC setup
Run ./cloudformation/vpc.yaml
#### Primary-VPC (us-east-1)
![screenshot](./screenshots/primary_Vpc.png)

![screenshot](./screenshots/primaryVPC_subnets.png)

![screenshot](./screenshots/primary_subnet_routing.png)

#### Secondary-VPC (us-west-2)
![screenshot](./screenshots/secondary_Vpc.png)

![screenshot](./screenshots/secondaryVPC_subnets.png)

![screenshot](./screenshots/secondary_subnet_routing.png)

### Primary RDS setup
run ./cloudformation/rds_primary.yaml

![screenshot](./screenshots/primaryDB_config2.png)

![screenshot](./screenshots/primaryDB_config.png)

![screenshot](./screenshots/primaryDB_subnetgroup.png)

### Primary RDS setup
run ./cloudformation/rds_secondary.yaml

![screenshot](./screenshots/secondaryDB_config2.png)

![screenshot](./screenshots/secondaryDB_config.png)

![screenshot](./screenshots/secondaryDB_subnetgroup.png)

### Primary RDS usage

[log_primary](logs/log_primary.txt)