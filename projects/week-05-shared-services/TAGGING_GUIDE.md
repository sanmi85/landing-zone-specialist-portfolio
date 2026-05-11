# Shared Subnet Tagging Guide

## Purpose
Define a consistent tagging standard so Terraform can dynamically discover shared subnets across accounts without hardcoding subnet IDs.

---

## Required Tags

- Name  
  Human-readable subnet name  
  Example: hub-shared-private-us-east-2a  

- Shared  
  Marks the subnet as shared  
  Value: true  

- Environment  
  Identifies the environment  
  Examples: shared, dev, prod  

- Tier  
  Defines the network tier  
  Examples: private, public, inspection  

- Role  
  Defines the subnet purpose  
  Example: shared-services  

- AvailabilityZone  
  Identifies the AZ  
  Example: us-east-2a  

---

## Example

Shared private subnet:

- Name = hub-shared-private-us-east-2a  
- Shared = true  
- Environment = shared  
- Tier = private  
- Role = shared-services  
- AvailabilityZone = us-east-2a  

---

## Terraform Usage

Terraform can discover subnets using tags instead of subnet IDs by filtering for:

- Shared = true  
- Environment = shared  
- Tier = private  

---

## Key Principle
Do not hardcode subnet IDs. Use consistent tagging to enable dynamic discovery and reusable infrastructure.