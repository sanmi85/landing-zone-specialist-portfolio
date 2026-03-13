# Landing Zone Hierarchy Design

## Organization Root

TRED Organization

## Level 1 Organizational Units

Security OU
Core OU
Workloads OU

## Security OU

Accounts responsible for centralized security services.

- Identity Management Account
- Security Tooling Account
- Log Archive Account

## Core OU

Accounts responsible for shared platform infrastructure.

- Networking Account
- Shared Services Account
- Platform Automation Account

## Workloads OU

Accounts hosting business applications and services.

- Dev-HR
- Dev-Finance
- Dev-Engineering
- UAT - HR
- UAT - Finance
- UAT - Engineering
- Prod-HR
- Prod-Finance
- Prod-Engineering

## Visual 3 level diagram

TRED Organization
│
├── Security OU
│   ├── Identity Management Account
│   ├── Security Tooling Account
│   └── Log Archive Account
│
├── Core OU
│   ├── Networking Account
│   ├── Shared Services Account
│   └── Platform Automation Account
│
└── Workloads OU
    ├── Dev-HR
    ├── Dev-Finance
    ├── Dev-Engineering
    │
    ├── UAT-HR
    ├── UAT-Finance
    ├── UAT-Engineering
    │
    ├── Prod-HR
    ├── Prod-Finance
    └── Prod-Engineering