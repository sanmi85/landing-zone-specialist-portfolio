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

ROOT
├── Security OU
│   └──(Future: Audit & Log Accounts)
└── Workloads OU
    ├── [Development] (OU) <-- Nested Child
    │    └── (Future: Sandbox & Dev Accounts)
    └── [Production]  (OU) <-- Nested Child
        └── (Future: High-Availability Apps)

    {
    "OrganizationalUnits": [
        {
            "Id": "ou-xxaz-0eecost1",
            "Arn": "arn:aws:organizations::654654245415:ou/o-0scg53y7o1/ou-xxaz-0eecost1",
            "Name": "Production"
        },
        {
            "Id": "ou-xxaz-ff4ilnjr",
            "Arn": "arn:aws:organizations::654654245415:ou/o-0scg53y7o1/ou-xxaz-ff4ilnjr",
            "Name": "Development"
        }
    ]
}
~