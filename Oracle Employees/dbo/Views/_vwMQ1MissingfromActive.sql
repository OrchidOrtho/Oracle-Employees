



CREATE VIEW [dbo].[_vwMQ1MissingfromActive]
AS
SELECT DISTINCT 
       t.[Business Unit]
      ,t.[Location]
      ,t.[Employee Number]
      ,t.[Employee Last Name]
      ,t.[Employee first name]
      ,t.[Employee middle name initial]
      ,t.[Employee suffix]
      ,t.[Employee nickname]
      ,RIGHT(t.[Assignment Number],LEN(t.[Assignment Number])-1) as clocknumber
      ,t.[Employee activity code]
      ,t.[Person type]
      ,t.[Employee type]
      ,t.[Employment type]
      ,t.[Supervisor]
      ,t.[Last hire date]
      ,t.[Seniority date]
      ,t.[Termination date]
      ,t.[Pay frequency]
      ,t.[Shift]
      ,t.[Job title]
      ,t.[Job Code]
      ,t.[Last check date]
      ,t.[Business title]
      ,t.[LastModifiedDate]
      ,t.[LastAction]
      ,t.[MxDate]
  FROM [OracleEE].[dbo].[_vwMQ1Hist] as t
  where RIGHT(t.[Assignment Number],LEN(t.[Assignment Number])-1) not in 
        (Select clocknumber FROM [OracleEE].[dbo].[_vwMQ1Test])
	AND t.[MxDate] BETWEEN DATEADD(day,-14,GETDATE()) AND DATEADD(day,-1,GETDATE())




