# Oracle-Employees
Solution to manage the database objects for the OracleEE database.  This database is used to bring in the employees from Oracle Fusion on a nightly basis from a text file that is exported and saved on an FTP site.

# Process Flow
1. Changes are made to the Oracle Fusion HRIS system
1. On a nightly basis the data from Oracle Fusions is exported to a text file (this part is currently handled by a vendor called Jibe)
1. The file is upload to an Orchid SFTP site
   1. The ftp site can be access via \\nfs8001\sftp\
1. At 6:30 AM ET a SQL Server job running on server SQL5002 executes to pull the data from the text file on the FTP site into a SQL Server database on SQL5002 called OracleEE.
   1. The first step of the job is to Trucate the OracleEE table, this removes all of the data from the OracleEE table
   1. The second step of the job finds the most recent file on the ftp site, copies the file from the FTP site to O:\Financial Statement Work Area\Payroll\ftp_inbox, converts the text file to a CSV file and then imports the data into the OracleEE table from the CSV file.  This is all accomplished via an SSIS package.
   1. The final step of the job adds an audit record to the OracleEE_Hist table.  The first time a record is added to this table it has a LastAction of NEW, any subsequent adds to this table for the same employee as a LastAction of UPDATE.  This data can be used to find out when changes were made to an employee record.
1. The data in the OracleEE table is then ready to be used by various applications.  The current known uses are:
   1. Elements Employee Esync - this adds/updates the appropriate employee records to Elements (Quality Management System.)
   1. Iunctum - this data is used as part of the Iunctum payroll system.
