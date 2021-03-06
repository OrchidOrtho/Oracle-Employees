﻿CREATE TABLE [dbo].[OOSAEL] (
    [RowPointer]              INT         IDENTITY (1, 1) NOT NULL,
    [PersonNumber]            NCHAR (15)  NULL,
    [Name]                    NCHAR (150) NULL,
    [StartDate]               DATE        NULL,
    [JobTitle]                NCHAR (250) NULL,
    [LaborClass]              NCHAR (15)  NULL,
    [BusinessTitle]           NCHAR (255) NULL,
    [JobFamily]               NCHAR (100) NULL,
    [JobFunctionName]         NCHAR (100) NULL,
    [SalaryBasis]             NCHAR (100) NULL,
    [NewSalary]               NCHAR (50)  NULL,
    [JobManagerLevel]         NCHAR (100) NULL,
    [EEOCode]                 NCHAR (100) NULL,
    [FLSAStatus]              NCHAR (100) NULL,
    [ManagerName]             NCHAR (150) NULL,
    [ManagerPersonNumber]     NCHAR (25)  NULL,
    [BusinessUnitName]        NCHAR (100) NULL,
    [DeptName]                NCHAR (200) NULL,
    [LocationName]            NCHAR (100) NULL,
    [SiteName]                NCHAR (255) NULL,
    [EnterpriseSeniorityDate] DATE        NULL,
    [Shift]                   NCHAR (50)  NULL
);

