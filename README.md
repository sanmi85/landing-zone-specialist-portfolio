# Enterprise Landing Zone Architecture Portfolio

## Project Information

**Project:** Enterprise AWS Landing Zone Architecture  
**Author:** Olu Thompson  
**Date:** March 2026  
**Type:** Cloud Architecture Portfolio Project

## Tech Stack

- **Cloud Platform:** AWS
- **Identity & Access:** AWS IAM, AWS Identity Center
- **Security & Monitoring:** AWS CloudTrail, AWS GuardDuty
- **Infrastructure:** Amazon VPC
- **Governance:** AWS Organizations, Service Control Policies (SCPs)

## Overview

This project demonstrates the design of an enterprise-scale AWS Landing Zone that supports secure, scalable, and well-governed cloud environments.

The architecture addresses common enterprise challenges such as:

- Cloud service quota limitations
- Compliance and regulatory requirements
- Security isolation between environments
- Governance and operational management at scale

The proposed solution uses a **multi-account landing zone architecture** built with AWS Organizations to distribute workloads across multiple accounts and enforce governance through Organizational Units (OUs) and Service Control Policies (SCPs).

## Architecture Goals

The landing zone design focuses on the following objectives:

- **Scalability** – Support dozens of business units and environments
- **Security Isolation** – Reduce blast radius between workloads
- **Centralized Governance** – Enforce security policies at the organization and OU level
- **Operational Efficiency** – Simplify management of cloud environments


## Organizational Structure

The architecture uses AWS Organizations to structure accounts into multiple Organizational Units (OUs).
