# Log Retention Plan

## Industry Selected
Finance / Financial Services

## Purpose
Security and audit logs must be retained to support incident investigation, regulatory review, compliance audits, and forensic analysis.

## Retention Requirement
For financial services environments, logs should generally be retained for a minimum of 7 years where they support audit, compliance, transaction review, or security investigation requirements.

## Log Types Covered
- AWS CloudTrail logs
- VPC Flow Logs
- IAM activity logs
- S3 access logs
- Security monitoring logs
- GuardDuty findings
- Config change history

## Retention Strategy
- Store logs in a centralized S3 log archive bucket.
- Enable versioning for protection against accidental deletion.
- Enable Object Lock or retention controls where required.
- Restrict access to the security or audit account.
- Use lifecycle policies to transition older logs to lower-cost storage such as S3 Glacier.

## Rationale
A 7-year retention period supports long-term auditability, forensic investigation, and regulatory expectations commonly associated with financial services environments.

## Notes
Retention requirements may vary depending on jurisdiction, regulator, business policy, and specific compliance obligations. Final retention periods should be validated with legal, compliance, and risk teams.