# CIDR Allocation Plan

## Overview
This plan defines non-overlapping CIDR blocks for the Hub-and-Spoke network architecture.

## CIDR Blocks

- Hub (Network Account):        10.1.0.0/16
- Spoke 1 (DEV):                10.2.0.0/16
- Spoke 2 (PROD):               10.3.0.0/16

## Notes
- All CIDR ranges are non-overlapping to allow for VPC peering or Transit Gateway routing.
- /16 ranges provide sufficient IP space for future subnetting and scaling.
- Each VPC can be subdivided into smaller subnets (e.g., /24) for public, private, and isolated tiers.