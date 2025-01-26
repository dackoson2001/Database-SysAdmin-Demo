# My DBA and SysAdmin Toolkit Project

## Project Overview

This project showcases my skills in database administration (DBA), systems administration (SysAdmin), and consulting. It includes the installation, management, and migration of databases, configuring virtual environments, setting up firewalls, and consulting on technical decisions. The toolkit demonstrates my ability to work with various technologies, including SQL Server, Azure, AWS, PowerShell, and more.

## Technologies Used

- **Database Management**: SQL Server, Azure SQL Database, AWS RDS
- **Virtual Environments**: VirtualBox, AWS EC2, Azure VMs
- **Operating Systems**: Windows Server, Linux (Ubuntu)
- **Scripting**: PowerShell, SQL Scripts
- **Cloud Services**: AWS, Azure

## Installation Instructions

1. **Clone this repository**:
    ```bash
    git clone https://github.com/yourusername/my-toolkit-project.git
    ```

2. **Set up SQL Server**:
    - Download and install SQL Server (or use an existing cloud instance).
    - Run the `install_script.sql` to set up the database schema.

3. **Set up a virtual machine**:
    - Use VirtualBox or AWS to set up a VM.
    - Follow the instructions in the `virtual_machine_setup.ps1` to configure the VM.

4. **Run monitoring queries**:
    - Use the `monitoring_queries.sql` to run basic health checks on the database.

5. **Backup and Restore**:
    - Use the `backup_restore_script.sql` to back up and restore your SQL database.

For any further details, check the individual files in their respective folders.

## Project Structure

- **Database**: Contains SQL scripts for database installation, monitoring, and migration.
    - `install_script.sql`: SQL script to set up the initial database schema.
    - `monitoring_queries.sql`: Queries for monitoring the health of the database.
    - `migration_plan.md`: Plan detailing the process of migrating data.
    - `backup_restore_script.sql`: Script to backup and restore the database.

- **SysAdmin**: Contains PowerShell scripts for virtual machine setup, firewall configuration, and other sysadmin tasks.
    - `server_migration_plan.md`: Plan for migrating an application server from on-premises to the cloud.
    - `virtual_machine_setup.ps1`: PowerShell script to set up a basic virtual machine on AWS or Azure.
    - `firewall_config.ps1`: PowerShell script for setting up basic firewall rules.

- **Consulting**: Includes documentation on stakeholder communication and project proposals.
    - `stakeholder_report.md`: Report aimed at non-technical stakeholders explaining key project decisions.
    - `technical_decision_matrix.md`: Document outlining technical decisions and the reasoning behind them.
    - `project_proposal.md`: Proposal document with project scope, timeline, and objectives.

## How to Test the Project

### 1. Test Database Setup
- After setting up SQL Server, run the `install_script.sql` to create the initial database.
- Execute the `monitoring_queries.sql` to verify the health of the database.

### 2. Test Virtual Machine Setup
- Use the `virtual_machine_setup.ps1` script to create a new VM in AWS or Azure.
- Verify that the VM is properly configured with the necessary settings, such as networking and firewall.

### 3. Test Backup and Restore
- Use the `backup_restore_script.sql` to back up the database and restore it to verify the backup process works.

### 4. Review Consulting Documents
- Review the **`stakeholder_report.md`** to understand how you would communicate technical decisions to non-technical stakeholders.
- Go through the **`technical_decision_matrix.md`** and **`project_proposal.md`** to understand the reasoning behind your technical choices.

## License

This project is for portfolio purposes and is not licensed for commercial use. All rights reserved.
