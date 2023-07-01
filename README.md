# AWS Cloud
> AWS cloud projects

## Table of Contents
* [Project 1](#project-1)


## Project 1
Create staging tables and analyzing tables in Redshift, drop all tables if they are existed
$ python create_tables.py 


### VPC setup
Run ./cloudformation/vpc/yaml
#### primary-VPC (us-east-1)
![screenshot](./screenshot/primary_Vpc.png)

![screenshot](./screenshot/primaryVPC_subnets.png)

![screenshot](./screenshot/primary_subnet_routing.png)

#### secondary-VPC (us-west-2)
![screenshot](./screenshot/secondary_Vpc.png)

![screenshot](./screenshot/secondaryVPC_subnets.png)

![screenshot](./screenshot/secondary_subnet_routing.png)
