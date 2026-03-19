# Regional Availability.md 

Restricted region check -- Attempted to access this region – “aws controltower list-enabled-controls --region af-south-1” but I got this response -  aws: [ERROR]: An error occurred (UnrecognizedClientException) when calling the ListEnabledControls operation: The security token included in the request is invalid. – 


Architectural Conclusion:
The command failed due to expired temporary AWS credentials. This error is related to authentication and does not indicate a Control Tower configuration or regional availability issue. The AWS session must be refreshed before the test can be validated.


## Regional Availability

This assessment evaluates whether the selected cloud region supports the services required to implement the proposed architecture successfully.


## Restricted Region Check

This check evaluates whether restricted regions support the required services and whether the organization's authentication and identity configuration is recognized and permitted in those regions i.e AWS control tower