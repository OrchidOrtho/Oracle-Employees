USE [msdb]
GO

/****** Object:  Job [OracleEE]    Script Date: 9/25/2018 1:19:13 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 9/25/2018 1:19:14 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'OracleEE', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Reading a text file from O:\Financial Statement Work Area\Payroll\Oracle EE to refresh the Oracle file that''s supports the programs:          - Iunctum, MQ1 and Drug testing', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Truncate OracleEE table]    Script Date: 9/25/2018 1:19:14 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Truncate OracleEE table', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=2, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Truncate Table OracleEE', 
		@database_name=N'OracleEE', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Oracle EE Data from Flat File]    Script Date: 9/25/2018 1:19:14 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Oracle EE Data from Flat File', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/SQL "\"\OracleEEv4\"" /SERVER SQL5002 /CONNECTION DestinationConnectionOLEDB;"\"Data Source=SQL5002;Initial Catalog=OracleEE;Provider=SQLNCLI10;Integrated Security=SSPI;Auto Translate=false;\"" /CONNECTION SourceConnectionFlatFile;"\"\\fs1003\OrchidOrg\Financial Statement Work Area\Payroll\Oracle EE\OracleEE.csv\"" /CHECKPOINTING OFF /REPORTING E', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [OracleEE Hist Update]    Script Date: 9/25/2018 1:19:14 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'OracleEE Hist Update', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'----- M2M ERP --------
-----
----- 
----- LPG 14 Sep 2018 - Creation
----  Maintain a historical file from Oracle for x months - support MQ1 term employees

/*  Start Process */  

USE OracleEE
Go

DECLARE 
    @MaxModDate as datetime

SELECT @MaxModDate =  DATEADD(month, -36, GETDATE())

-------------------------------
--- delete data from [OracleEE_Hist] when the LastModifiedDate <= current date - X  months
  DELETE FROM [OracleEE].[dbo].[OracleEE_Hist] where [LastModifiedDate] = @MaxModDate and LASTACTION = ''UPDATE''

/****** Script for SelectTopNRows command from SSMS  ******/

INSERT INTO [OracleEE].[dbo].[OracleEE_Hist] (
            [OracleEE_ID]
      ,[Business Unit]
      ,[Cost Center Code]
      ,[Cost Center Name]
      ,[Location]
      ,[Employee Number]
      ,[Employee Last Name]
      ,[Employee first name]
      ,[Employee middle name initial]
      ,[Employee suffix]
      ,[Employee nickname]
      ,e.[Assignment Number]
      ,[Employee SSN government ID]
      ,[Employee DOB]
      ,[Employee street address 1]
      ,[Employee street address 2]
      ,[Employee street address 3]
      ,[Employee street address 4]
      ,[Employee city]
      ,[Employee state]
      ,[Employee postal code]
      ,[Employee country]
      ,[Employee telephone number country]
      ,[Employee telephone number area code]
      ,[Employee telephone number]
      ,[Employee cell phone country]
      ,[Employee cell phone area code]
      ,[Employee cell phone]
      ,[Employee e-mail]
      ,[Employee gender]
      ,[Employee marital status]
      ,[Employee citizenship]
      ,[Employee activity code]
      ,[Person type]
      ,[Employee type]
      ,[Employment type]
      ,[Supervisor]
      ,[Last hire date]
      ,[Seniority date]
      ,[Termination date]
      ,[Pay frequency]
      ,[Shift]
      ,[Job title]
      ,[Job Code]
      ,[Last check date]
      ,[Salary Basis]
      ,[Current pay rate]
      ,[Business title]
	  ,[LastModifiedDate]
	  ,LASTACTION
	  )
SELECT [OracleEE_ID]
      ,[Business Unit]
      ,[Cost Center Code]
      ,[Cost Center Name]
      ,[Location]
      ,[Employee Number]
      ,[Employee Last Name]
      ,[Employee first name]
      ,[Employee middle name initial]
      ,[Employee suffix]
      ,[Employee nickname]
      ,e.[Assignment Number]
      ,[Employee SSN government ID]
      ,[Employee DOB]
      ,[Employee street address 1]
      ,[Employee street address 2]
      ,[Employee street address 3]
      ,[Employee street address 4]
      ,[Employee city]
      ,[Employee state]
      ,[Employee postal code]
      ,[Employee country]
      ,[Employee telephone number country]
      ,[Employee telephone number area code]
      ,[Employee telephone number]
      ,[Employee cell phone country]
      ,[Employee cell phone area code]
      ,[Employee cell phone]
      ,[Employee e-mail]
      ,[Employee gender]
      ,[Employee marital status]
      ,[Employee citizenship]
      ,[Employee activity code]
      ,[Person type]
      ,[Employee type]
      ,[Employment type]
      ,[Supervisor]
      ,[Last hire date]
      ,[Seniority date]
      ,[Termination date]
      ,[Pay frequency]
      ,[Shift]
      ,[Job title]
      ,[Job Code]
      ,[Last check date]
      ,[Salary Basis]
      ,[Current pay rate]
      ,[Business title]
	  ,GETDATE() as [LastModifiedDate]
	  ,CASE WHEN COALESCE(h.Cnt,0) <= 0 THEN ''NEW'' ELSE ''UPDATE'' END as LASTACTION
  FROM [OracleEE].[dbo].[OracleEE] as e
       LEFT JOIN  (SELECT [Assignment Number], COUNT([Assignment Number]) as Cnt FROM [OracleEE].[dbo].[OracleEE_Hist] GROUP BY [Assignment Number]) as h
	               ON e.[Assignment Number] = h.[Assignment Number]', 
		@database_name=N'OracleEE', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'OracleEE', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20160620, 
		@active_end_date=99991231, 
		@active_start_time=63000, 
		@active_end_time=235959, 
		@schedule_uid=N'ad1ec56a-568a-4a24-9b08-3f7e6ec95373'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

