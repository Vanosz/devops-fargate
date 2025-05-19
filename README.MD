# DevOps Take-Home Assignment – NGINX on AWS Fargate with ALB (Terraform)

## Overview with approaches and rational

This Terraform project launching a new web service that is publicly accessible on AWS.
| Decision | Reason |
|---------|----------------|
| Main service for hosting nginx | **ECS Fargate** - container serverless model for simplicity and in the future - scalability |
| Main image for nginx | **Alpine** - Lightweight, official image that is nice for simple web service |
| How many containers | **Desired + min\max = 1** - cost-effective according to ECS fargate but ready to scale when needed |
| Entarnce for income traffic | **ALB instead of direct IP** - ALB provides a stable public entry point, scalability support, helthchecks and like simple security point |
| Reused infrastructure approach | **Modules in terraform** - VPC and ECS logic are separated for reuse and clarity |
| No public-facing NGINX | **ECS fargate behind ALB** - basic secure point for a hide a direct ip of nginx service |

*Fargate don't need a supported infrastructure based on EC2 (like for ECS or EC2 solution and simplify in the future the service scale)

---

## How to deploy via GitHub actions
*no special requirements needed, but still need the working values for AWS env
AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY  
This values already set in "secrets" in github actions settings but don't have any existing values

### Deploy by commit
- This project has autodeploy by commit to the main, you just need to push smt to the main

### Manual deploy
- Just run via UI in github actions a direct button "Run workflow"

## How to deploy manually via Terraform

### 1. Basic requirements

- AWS cli with credentials configured
- Terraform cli version (>= 1.3.0)
- AWS permissions for ECS Fargate, VPC, IAM, and ALB

### 2. Configure aws credentials

#### install AWS cli and Terraform cli by the next (linux example, acceptable if you don't have it already):
aws cli -
```
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

terrafom cli -
go to the link below and finish instructions
```
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
```
after installation of TF client, check it with the next command in the console (should be >= 1.3.0):
```
terraform --version
```

for AWS cli, run the next after succesfully done a previous step
```
aws configure
```

#### fill the data over the next hints from the configure (especially next)
*you should already take\create this aws data on the aws side before run a tf infra creation

| Point | What to add |
|---------|----------------|
| **AWS Access Key ID:** | here is an acceess key id |
| **AWS Secret Access Key:** | here is a secret acceess key |
| **Default region name:** | us-east-1 |
| **Default output format:** | json |


### 3. Clone the Repository

```
git clone https://github.com/vanosz/devops-fargate.git
cd devops-fargate
```

### 4. Initialize Terraform, review\plan and apply
#### (run the next step-by-step in a console)

```
terraform init
```
```
terraform validate
```
```
terraform fmt
```
```
terraform plan
```
```
terraform apply
```

### 5. Access the nginx web service
#### Check the output value after previous last step
```
terraform output alb_dns_name
```

#### Open your browser with http://"alb_dns_name"


## Areas for improvement
- **Enable HTTPS**:
  - Add cert manager for provide and change a certificate for HTTPS enabling
- **Enable autoscaling**:
  - Set min_capacity = 1 and max_capacity > 1, based on few metrics
- **Private subnets + NAT gateway**:
  - Move Fargate into private subnet(s) for better security
- **Custom docker image**:
  - Dockerfile for better control the nginx configuration
- **Advanced monitoring**:
  - CloudWatch dashboards, log groups, other detailed metrics
- **CI/CD integration with approvals**:
  - To add to the GitHub actions for plan/apply the approvals
- **Add aws shield**:
  - for the future to prevent the ddos and add more security points






