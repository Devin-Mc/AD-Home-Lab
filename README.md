Active Directory Home Lab
A fully functional Active Directory environment built from scratch using VirtualBox and Windows Server 2022. This lab simulates a real enterprise directory services setup including domain configuration, user provisioning, Group Policy, and domain-joined clients.

Lab Architecture
MachineOSRoleIPDC01Windows Server 2022Domain Controller, DNS192.168.10.1CLIENT01Windows 10 ProDomain-joined workstation192.168.10.2
Domain: lab.local
Network: VirtualBox Internal Network (isolated)

What Was Built
Active Directory Domain Services

Deployed Windows Server 2022 on VirtualBox and promoted it to a Domain Controller
Created a new Active Directory forest and root domain (lab.local)
Configured DNS server integrated with AD for name resolution
Set forest and domain functional levels to Windows Server 2016

Organizational Structure
Created a logical OU structure mirroring enterprise environments:
lab.local
├── IT
├── HR
└── Finance
PowerShell User Provisioning
Wrote a PowerShell script to bulk-create domain users from a CSV file, automatically placing each user in the correct OU based on department.

10 users provisioned across 3 departments
Accounts created with UPN format (username@lab.local)
Accounts enabled with consistent password policy applied

Script: createusers.ps1
Data: users.csv
Group Policy
Configured Group Policy Objects (GPOs) on the Default Domain Policy:

Password Policy: Minimum 10-character length, complexity requirements enabled
Account Lockout Policy: 5 invalid attempt threshold, 30-minute lockout duration

Domain-Joined Client

Deployed Windows 10 Pro on a second VM
Configured static IPs and internal network routing between VMs
Joined CLIENT01 to lab.local domain
Verified domain authentication by logging in as a provisioned domain user


Skills Demonstrated

Windows Server administration
Active Directory DS installation and configuration
DNS configuration and troubleshooting
PowerShell scripting for user automation
Group Policy Object creation and management
Network configuration (static IPs, internal routing)
Hypervisor setup and VM networking (VirtualBox)
Troubleshooting authentication and connectivity issues


Tools & Technologies

Oracle VirtualBox
Windows Server 2022 (180-day evaluation)
Windows 10 Pro
PowerShell
Active Directory Users and Computers
Group Policy Management Console


Files in This Repo
FileDescriptioncreateusers.ps1PowerShell script to bulk-create AD users from CSVusers.csvSample user data used for provisioningREADME.mdThis file
