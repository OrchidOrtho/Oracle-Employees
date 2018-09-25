-- =============================================
-- Author:		Larry Garza
-- Create date: 2016 Apr 05
-- Description:	Payroll Project - Update Iunctum table _PayEEMain from the Oracle HRIS Feed
-- =============================================
CREATE PROCEDURE [dbo].[Proc_UpdatePayEEMain_Iunctum] 
	
AS
	DECLARE @iEENum  varchar(10),
			@oEENum  varchar(10),
			@oTermDate  varchar(50),
			@oEmployeeType  varchar(50),
			@oSenorityDate  varchar(50)
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Begin Try

    -- Cursor to grab all employee numbers from table _PayEEMain
	update _PayEEMain
SET _PayEEMain.pSalHr =  CASE OracleEE.[Employee type] WHEN 'Salaried' THEN 'S' ELSE 'H' END, 
	_PayEEMain.penddate =  CONVERT(datetime,OracleEE.[Termination date],120) , 
	_PayEEMain.pfhiredate =  CONVERT(datetime,OracleEE.[Seniority date],120)  
FROM _PayEEMain
	 INNER JOIN OracleEE
	 ON (_PayEEMain.pEmpno = OracleEE.[Employee Number]);

UPDATE _PayStage
SET _PayStage.aSalHour =  CASE OracleEE.[Employee type] WHEN 'Salaried' THEN 'S' ELSE 'H' END, 
	_PayStage.fendate =  CONVERT(datetime,OracleEE.[Termination date],120) , 
	_PayStage.fhiredate =  CONVERT(datetime,OracleEE.[Seniority date],120)  
FROM _PayStage
	 INNER JOIN OracleEE
	 ON (_PayStage.fEmpno = OracleEE.[Employee Number]);

	End Try

	Begin Catch
		Select ERROR_NUMBER() as ErrorNumber;
		Select ERROR_MESSAGE() as ErrorMessage;
	End Catch
END
