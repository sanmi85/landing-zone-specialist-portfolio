# TRED ORGANIZATION 

ROOT
├── Security OU
│   └──(Future: Audit & Log Accounts)
└── Workloads OU
    ├── [Development] (OU) <-- Nested Child
    │    └── (Future: Sandbox & Dev Accounts)
    └── [Production]  (OU) <-- Nested Child
        └── (Future: High-Availability Apps)




## Strategy

I implemented a **lifecycle based strategy** (Dev/Prod) nested under a functional parent (Workloads)

**The Strategy:** By seperating Development from Production at the OU level, we can conveniently apply Service Control Policies (SCPs) that act as guardrails. Foe example, we can apply a policy to the 'Production' OU that prevents anyone from deleting a database while we leave the 'Development' OU open for experimentation. This structure ensures that if we make a mistake in a 'DEV' account, there is a **Zero Blast Radius** impact on 'Production'.