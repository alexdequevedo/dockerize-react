# Sample App

Sample Application to be deployed on Compute Engine

## User Permissions

The User / Service Account that is doing the deploy will need
* `Compute Admin` - In the project where the VM will be deployed. For creating compute engine instance
* `IAP-secured Tunnel User` - In the project where the VM will be deployed. For connecting to the compute engine instance

* `Compute Security Admin` - In the project with the host networking VPC. For creating firewall rule to allow ssh access

## Deploy Infrastructure
From the `infra` directory run
```
gcloud auth application-default login

terraform -chdir=./compute init
terraform -chdir=./compute apply

terraform -chdir=./networking init
terraform -chdir=./networking apply
```

## Viewing Application

Click the `SSH` button on the compute engine instance to connect to the vm through ssh. Then run
```
curl http://localhost:3000
```
