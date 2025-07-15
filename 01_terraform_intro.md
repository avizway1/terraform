# Day 1: Introduction to Terraform & Infrastructure as Code

## What is Infrastructure as Code (IaC)?

Infrastructure as Code (IaC) is a modern IT practice that enables infrastructure provisioning and management using code, rather than manual processes.

### Key Benefits:
- **Automation**: Replace manual provisioning with scripts.
- **Repeatability**: Deploy the same environment consistently.
- **Speed**: Faster cloud adoption and provisioning.
- **Self-service**: Teams can request infrastructure on demand.
- **Standardization**: Reduces human error and enforces consistency.
- **Collaboration**: Code can be versioned, reviewed, and shared.

---

## Tools for IaC

Common IaC tools include:

| Tool | Description |
|------|-------------|
| **Terraform** | Cloud-agnostic tool from HashiCorp |
| **AWS CloudFormation** | AWS-native IaC tool |
| **Azure Resource Manager (ARM)** | Azure-native tool |
| **Google Deployment Manager** | GCP-native tool |
| **Pulumi** | Supports multiple languages (TS, Python, Go, etc.) |

---

## Why Terraform?

Terraform is a **platform-agnostic**, **declarative**, **open-source** tool created by HashiCorp that uses HCL (HashiCorp Configuration Language) to define infrastructure.

### Terraform's Purpose:
- Manage infrastructure across multiple platforms (AWS, Azure, GCP, etc.)
- Version control for infrastructure
- Safe, predictable infrastructure changes
- Scalable and modular configurations

---

## Terraform Core Concepts

| Component | Description |
|----------|-------------|
| **Provider** | Interfaces with cloud APIs (e.g., AWS, Azure) |
| **Resource** | Describes infrastructure elements (e.g., EC2, VPC) |
| **Module** | Reusable collection of Terraform files |
| **State** | Maps your configuration to real-world resources |
| **Variable** | Parameterizes your configuration |
| **Output** | Displays results (e.g., IP address) |
| **Backend** | Manages how state is loaded/stored (local, S3, etc.) |


---

### **Provider**

A **provider** tells Terraform how to interact with an external platform like AWS, Azure, GCP, GitHub, or even databases and SaaS apps.

* Think of it as a plugin that speaks the "language" of your cloud or service.
* Examples: `aws`, `azurerm`, `google`, `kubernetes`, `github`

```hcl
provider "aws" {
  region = "us-east-1"
}
```

---

### **Resource**

A **resource** block defines what infrastructure you want to create. It could be an EC2 instance, a VPC, an S3 bucket, etc.

* These are the actual infrastructure objects being provisioned.
* Every resource has a **type** and **name**.

```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159"
  instance_type = "t2.micro"
}
```

---

### **Module**

A **module** is a reusable group of Terraform files (like a mini-project). It allows you to organize and reuse code for repeatable infrastructure patterns.

* Think of it like a “function” in programming.
* You can use **official modules** from the Terraform Registry or create your own.

```hcl
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "my-vpc"
  cidr   = "10.0.0.0/16"
}
```

---

### **State**

Terraform tracks the current state of your infrastructure in a **state file** (`terraform.tfstate`).

* It remembers what has been created already.
* On every run, it compares the desired state (your code) with the actual state (real resources) and shows the difference.

```bash
terraform show       # View current state
terraform state list # List all resources being managed
```

---

### **Variable**

Variables allow you to **parameterize** your configuration. Instead of hardcoding values, you define variables in `.tf` files or input them dynamically.

* Great for reusability and avoiding duplication.

```hcl
variable "region" {
  default = "us-east-1"
}

provider "aws" {
  region = var.region
}
```

---

### **Output**

Outputs are used to **display values** after Terraform runs — like public IPs, DNS names, or IDs.

* Helpful for debugging or passing values to other modules or scripts.

```hcl
output "instance_ip" {
  value = aws_instance.web.public_ip
}
```

---

### **Backend**

The **backend** controls where the state file is **stored and how it's shared**. By default, it's stored locally, but in teams, it's better to use cloud storage (e.g., S3, Azure Blob).

* Helps with **state locking**, **sharing**, and **remote collaboration**.

```hcl
terraform {
  backend "s3" {
    bucket = "my-terraform-states"
    key    = "dev/vpc.tfstate"
    region = "us-east-1"
  }
}
```


---

## Terraform Benefits

- **Platform Agnostic**: Write once, use across clouds.
- **Declarative Language**: Describe the desired state, not steps.
- **Automation & Efficiency**: Reduce human interaction.
- **Collaboration**: Infrastructure as shared, version-controlled code.
- **Consistency & Repeatability**: Avoid config drift.
- **Auditability**: Track infrastructure changes over time.

---

## Declarative vs Imperative

| Approach | Description | Example |
|----------|-------------|---------|
| **Declarative** | Define what you want | `Create an EC2 instance with type t2.micro` |
| **Imperative** | Define how to do it step-by-step | `Step 1: Login → Step 2: Click EC2 → Step 3: Launch` |

Terraform uses the **declarative** approach.

---

## HashiCorp Configuration Language (HCL)

- Designed for readability and simplicity
- Uses `.tf` files (e.g., `main.tf`, `variables.tf`)
- Block-based syntax (resource, variable, provider)

Example:
```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159"
  instance_type = "t2.micro"
}
```

---

## Terraform Workflow (High-Level Overview)

1. **Write** - Author your configuration using HCL.
2. **Plan** - Preview what will change.
3. **Apply** - Apply changes to the real infrastructure.
4. **Destroy** - Tear down infrastructure if needed.

---

## Summary

- IaC revolutionizes infrastructure delivery through code.
- Terraform is a powerful, cloud-agnostic IaC tool.
- Understand the declarative approach and key components.
- Terraform configurations are written in HCL.
- The workflow (Write → Plan → Apply → Destroy) forms the backbone of using Terraform effectively.

---
