CREATE TABLE [dbo].[Orchid_Site] (
    [Orchid_Site_ID]     BIGINT        NOT NULL,
    [Orchid_Site_Number] VARCHAR (10)  NULL,
    [ParentSite_Name]    VARCHAR (50)  NULL,
    [Orchid_Site]        VARCHAR (100) NULL,
    [Orchid_Site_Desc]   VARCHAR (250) NULL,
    [Unit_ID]            INT           NULL,
    [HAL_SiteID]         VARCHAR (100) NULL,
    [Location]           VARCHAR (100) NULL,
    [Business_Unit]      VARCHAR (100) NULL,
    CONSTRAINT [PK_Orchid_Site] PRIMARY KEY CLUSTERED ([Orchid_Site_ID] ASC)
);

