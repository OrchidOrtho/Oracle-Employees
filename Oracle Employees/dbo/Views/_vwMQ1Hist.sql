
CREATE VIEW [dbo].[_vwMQ1Hist]
AS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT src.* from 
  (
      SELECT [OracleEE_ID]
      ,[Business Unit]
      ,[Location]
      ,[Employee Number]
      ,[Employee Last Name]
      ,[Employee first name]
      ,[Employee middle name initial]
      ,[Employee suffix]
      ,[Employee nickname]
      ,[Assignment Number]
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
      ,[Business title]
      ,[LastModifiedDate]
      ,[LastAction]
	  ,Max(LastModifiedDate) OVER (PARTITION BY [Business Unit], [Assignment Number])  as MxDate
      FROM [OracleEE].[dbo].[OracleEE_Hist]
   ) as src
where src.[LastModifiedDate] = src.Mxdate

