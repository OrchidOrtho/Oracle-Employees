


CREATE VIEW [dbo].[_vwMQ1]
AS
SELECT  DISTINCT    OE.[Employee first name] AS firstname, OE.[Employee Last Name] AS lastname, OE.[Employee middle name initial] AS initial, OE.[Employee e-mail] AS email, 
           OE.[Job title] AS title, OE.Shift, RIGHT(OE.[Assignment Number],LEN(OE.[Assignment Number])-1) AS clocknumber, CASE OE.[Employee type] WHEN 'Hourly' THEN 'H' ELSE 'S' END AS emptype, 
		   OE.[Last hire date] AS hiredate, OE.[Termination date] AS termdate, OE.[Job Code] AS deptno, '(   )    -    ' AS workphone, 
		   COALESCE((SELECT Top 1 OS.[Employee First Name] + ' ' + OS.[Employee Last Name] FROM dbo.OracleEE as OS WHERE OE.Supervisor = OS.[Employee Number]),'MISSING') as Supervisor,
		   CASE OE.[Employee activity code] WHEN 'ACTIVE' THEN 'A' ELSE 'I' END AS p_active, 
           ' ' AS dept, OE.[Seniority date] AS SeniorityDate, s.HAL_SiteID, OE.Location,
		   COALESCE(OE.[Business title], 'MISSING') as BusinessTitle,'MISSING' as BusinessUnitName, 'MISSING' as  DeptName --,  COALESCE(o.BusinessUnitName, 'MISSING') as BusinessUnitName,   COALESCE(O.DeptName, 'MISSING') as  DeptName
FROM         dbo.OracleEE as OE Left OUTER JOIN dbo.Orchid_Site as s ON 
			        oe.[Business Unit] = s.Business_Unit AND
			        oe.Location = s.Location  
				 -- LEFT OUTER JOIN dbo.OOSAEL as o ON
				 --oe.[Employee Number] = o.PersonNumber Left OUTER JOIN dbo.Orchid_Site as s ON 
			     --   oe.[Business Unit] = s.Business_Unit AND
			     --   oe.Location = s.Location  




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[16] 4[24] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 305
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vwMQ1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vwMQ1';

