# AWS Cloud
> AWS cloud projects

## Table of Contents
* [Project 1](#project-1)


## Project 1
Create staging tables and analyzing tables in Redshift, drop all tables if they are existed
$ python create_tables.py 


### Part 1: Data Durability And Recovery

#### Primary-VPC
Run ./cloudformation/vpc.yaml in region us-east-1

![screenshot](./screenshots/primary_Vpc.png)

![screenshot](./screenshots/primaryVPC_subnets.png)

![screenshot](./screenshots/primary_subnet_routing.png)

#### Secondary-VPC
Run ./cloudformation/vpc.yaml in regions us-west-2

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

### Monitor database
Observe the “DB Connections” to the database and how this metric changes as you connect to the database
![screenshot](./screenshots/monitoring_connections.png)

Observe the “Replication” configuration
![screenshot](./screenshots/monitoring_replication.png)

### Part 2: Failover And Recovery

#### secondaryDB before promotion
[log_rr_before_promotion](logs/log_rr_before_promotion.txt)
![screenshot](./screenshots/rr_before_promotion.png)

#### secondaryDB after promotion
[log_rr_after_promotion](logs/log_rr_after_promotion.txt)
![screenshot](./screenshots/rr_after_promotion.png)


### Part 3: Web Resiliency
First of all, upload files under ./s3 folder into aws s3 and setup cloudfront

Build a resilient static web hosting solution in AWS. Create a versioned S3 bucket and configure it as a static website.
![screenshot](./screenshots/s3_original.png)

“accidentally” change the contents of the website such that it is no longer serving the correct content
![screenshot](./screenshots/s3_season.png)

“recover” the website by rolling the content back to a previous
![screenshot](./screenshots/s3_season_revert.png)

You will now “accidentally” delete contents from the S3 bucket. Delete “winter.jpg”
![screenshot](./screenshots/s3_delete_marker.png)
![screenshot](./screenshots/s3_deletion.png)

“recover” winter.jpg object
![screenshot](./screenshots/s3_delete_revert.png)

