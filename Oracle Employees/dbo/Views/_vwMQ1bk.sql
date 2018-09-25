
CREATE VIEW [dbo].[_vwMQ1bk]
AS
SELECT     dbo.OracleEE.[Employee first name] AS firstname, dbo.OracleEE.[Employee Last Name] AS lastname, dbo.OracleEE.[Employee middle name initial] AS initial, 
                      dbo.OracleEE.[Employee e-mail] AS email, dbo.OracleEE.[Job title] AS title, dbo.OracleEE.Shift, dbo.OracleEE.[Employee Number] AS clocknumber, 
                      CASE dbo.OracleEE.[Employee type] WHEN 'Hourly' THEN 'H' ELSE 'S' END AS emptype, dbo.OracleEE.[Last hire date] AS hiredate, 
                      dbo.OracleEE.[Termination date] AS termdate, dbo.OracleEE.[Job Code] AS deptno, '(   )    -    ' AS workphone, 
                      dbo._vwSupervisorDetail.[Employee first name] + ' ' + dbo._vwSupervisorDetail.[Employee Last Name] AS Supervisor, 
                      CASE dbo.OracleEE.[Employee activity code] WHEN 'ACTIVE' THEN 'A' ELSE 'I' END AS p_active, ' ' AS dept, dbo.OracleEE.[Seniority date] AS SeniorityDate, 
                      dbo.Orchid_Site.HAL_SiteID AS site, dbo.OracleEE.Location
FROM         dbo.OracleEE INNER JOIN
                      dbo._vwSupervisorDetail ON dbo.OracleEE.Supervisor = dbo._vwSupervisorDetail.Supervisor LEFT OUTER JOIN
                      dbo.Orchid_Site ON dbo.OracleEE.[Business Unit] = dbo.Orchid_Site.Business_Unit AND dbo.OracleEE.Location = dbo.Orchid_Site.Location


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[18] 3) )"
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
         Begin Table = "OracleEE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 296
               Right = 305
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "_vwSupervisorDetail"
            Begin Extent = 
               Top = 228
               Left = 429
               Bottom = 336
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orchid_Site"
            Begin Extent = 
               Top = 20
               Left = 957
               Bottom = 268
               Right = 1135
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
      Begin ColumnWidths = 21
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
         Width = 1755
         Width = 2280
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
         Column = 2370
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vwMQ1bk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vwMQ1bk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vwMQ1bk';

