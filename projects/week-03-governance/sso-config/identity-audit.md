### Identity Audit – AWS Management Account

#### Summary

An identity audit was conducted on the AWS management account to review existing IAM users and determine suitability for migration to AWS IAM Identity Center (SSO).

#### Findings

* A total of **5 IAM users** were identified in the management account.
* All users represent **human (workforce) identities**.
* No service accounts or application-based IAM users were identified.

#### Assessment

* All identified IAM users are suitable candidates for migration to AWS IAM Identity Center (SSO).
* Continued use of IAM users for human access presents risks including:

  * Long-lived credentials
  * Decentralized access management
  * Increased attack surface

#### Recommendations

* Migrate all IAM users to AWS IAM Identity Center (SSO)
* Enforce Multi-Factor Authentication (MFA) via Identity Center
* Disable IAM user console access after migration
* Remove or rotate any existing IAM access keys

#### Conclusion

The current IAM user population consists entirely of human identities and should be fully transitioned to AWS IAM Identity Center to align with modern cloud security best practices.
