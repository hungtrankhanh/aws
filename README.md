# AWS Cloud
> AWS cloud projects

## Table of Contents
* [Project 1](#project-1)


## Project 1
* [Part 1: Data Durability And Recovery](#part-1:-data-durability-and-recovery)
* [Part 2: Failover And Recovery](#part-2:-Failover-and-recovery)
* [Part 3: Web Resiliency](#part-3:-web-resiliency)

### Part 1: Data Durability And Recovery

#### Primary-VPC
Run ./cloudformation/vpc.yaml in region us-east-1

![screenshot](./screenshots/primary_Vpc.png)

![screenshot](./screenshots/primaryVPC_subnets.png)

![screenshot](./screenshots/primary_subnet_routing.png)
<br />
#### Secondary-VPC
Run ./cloudformation/vpc.yaml in regions us-west-2

![screenshot](./screenshots/secondary_Vpc.png)

![screenshot](./screenshots/secondaryVPC_subnets.png)

![screenshot](./screenshots/secondary_subnet_routing.png)
<br />
#### Primary RDS setup
run ./cloudformation/rds_primary.yaml

![screenshot](./screenshots/primaryDB_config2.png)

![screenshot](./screenshots/primaryDB_config.png)

![screenshot](./screenshots/primaryDB_subnetgroup.png)
<br />
#### Primary RDS setup
run ./cloudformation/rds_secondary.yaml

![screenshot](./screenshots/secondaryDB_config2.png)

![screenshot](./screenshots/secondaryDB_config.png)

![screenshot](./screenshots/secondaryDB_subnetgroup.png)
<br />
#### Availability Estimate
[estimates](logs/estimates.txt)
<br />
#### Primary RDS usage
[log_primary](logs/log_primary.txt)
<br />
#### Monitor database
Observe the “DB Connections” to the database and how this metric changes as you connect to the database
![screenshot](./screenshots/monitoring_connections.png)
Observe the “Replication” configuration
![screenshot](./screenshots/monitoring_replication.png)
<br />
<br />
### Part 2: Failover And Recovery

#### secondaryDB before promotion
[log_rr_before_promotion](logs/log_rr_before_promotion.txt)
![screenshot](./screenshots/rr_before_promotion.png)
<br />
#### secondaryDB after promotion
[log_rr_after_promotion](logs/log_rr_after_promotion.txt)
![screenshot](./screenshots/rr_after_promotion.png)
<br />
<br />
### Part 3: Web Resiliency
First of all, upload files under ./s3 folder into aws s3 and setup cloudfront

Case 1 : Build a resilient static web hosting solution in AWS. Create a versioned S3 bucket and configure it as a static website.
![screenshot](./screenshots/s3_original.png)
<br />

Case 2 : “accidentally” change the contents of the website such that it is no longer serving the correct content
![screenshot](./screenshots/s3_season.png)
<br />

Case 3 : “recover” the website by rolling the content back to a previous
![screenshot](./screenshots/s3_season_revert.png)
<br />

Case 4 : You will now “accidentally” delete contents from the S3 bucket. Delete “winter.jpg”
![screenshot](./screenshots/s3_delete_marker.png)
![screenshot](./screenshots/s3_deletion.png)
<br />

Case 5 :“recover” winter.jpg object
![screenshot](./screenshots/s3_delete_revert.png)

