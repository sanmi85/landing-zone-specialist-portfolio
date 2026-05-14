# Security Posture Analysis

## Objective

The objective of this project was to create a unified security overview across the AWS Landing Zone by centralizing security findings from GuardDuty, IAM Access Analyzer, AWS Config, and Security Hub.

The implementation improved visibility into high-severity risks, enabled centralized monitoring across regions, and introduced automated alerting for critical security findings.

---

# Centralized Findings Aggregator

Security Hub was configured as the centralized aggregation platform for security findings across the AWS environment.

Integrated services included:

- Amazon GuardDuty
- IAM Access Analyzer
- AWS Config
- AWS Security Hub Standards

Cross-region aggregation was enabled using the Security Hub Finding Aggregator with `ALL_REGIONS` linking mode to centralize findings into a unified security view.

This architecture improved operational visibility and simplified incident identification across multiple AWS services and regions.

---

# High-Severity Alerting Logic

Automated alerting was implemented using Amazon EventBridge and Amazon SNS.

An EventBridge rule was configured to monitor Security Hub findings with the following conditions:

- Severity = HIGH or CRITICAL
- Workflow Status = NEW
- Record State = ACTIVE

Matching findings trigger notifications through the following workflow:

Security Hub → EventBridge → SNS Notification

This implementation enabled immediate awareness of high-risk security events and improved incident response readiness.

---

# Top Security Risks Identified

## 1. Overly Permissive Security Group Rules

### Risk

Security groups allowing unrestricted inbound access (0.0.0.0/0) increase the attack surface and expose workloads to unauthorized access attempts.

### Detection Source

- AWS Config
- Security Hub controls

### Remediation

- Restricted inbound access to approved IP ranges
- Removed unnecessary open ports
- Applied least privilege network segmentation principles

### Security Improvement

Reduced external exposure and improved network-level access control posture.

---

## 2. Excessive IAM Permissions and Root Account Risk

### Risk

Overly broad IAM permissions and root account usage increase the likelihood of privilege escalation or account compromise.

### Detection Source

- IAM Access Analyzer
- Security Hub IAM findings

### Remediation

- Reviewed IAM policies
- Reduced excessive permissions
- Enabled MFA enforcement
- Limited use of privileged accounts

### Security Improvement

Improved identity governance and reduced privilege escalation risk.

---

## 3. Threat Detection and Monitoring Gaps

### Risk

Without centralized threat monitoring, malicious activity may go undetected across accounts and regions.

### Detection Source

- Amazon GuardDuty
- Security Hub aggregated findings

### Remediation

- Enabled GuardDuty threat detection
- Centralized findings within Security Hub
- Implemented automated HIGH and CRITICAL severity alerting using EventBridge and SNS

### Security Improvement

Improved threat visibility and reduced incident response time for critical events.

---

# Conclusion

This project established a centralized cloud security monitoring and incident response foundation within the AWS Landing Zone.

By aggregating findings from multiple AWS security services, enabling automated high-severity alerting, and documenting remediation actions, the environment achieved improved visibility, governance, and operational security readiness.

The implementation aligned with core cloud security principles including centralized monitoring, least privilege, continuous detection, and automated response workflows.