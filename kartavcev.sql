USE [shoping]
GO
/****** Object:  Table [dbo].[Cotrydnic]    Script Date: 12.10.2022 20:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cotrydnic](
	[CotrydnicID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronomic] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DoljnoctID] [int] NOT NULL,
	[DateOfBrith] [date] NOT NULL,
	[IDUser] [int] NOT NULL,
 CONSTRAINT [PK_Cotrydnic] PRIMARY KEY CLUSTERED 
(
	[CotrydnicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doljnoct]    Script Date: 12.10.2022 20:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doljnoct](
	[DoljnoctID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Doljnoct] PRIMARY KEY CLUSTERED 
(
	[DoljnoctID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[klient]    Script Date: 12.10.2022 20:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klient](
	[kod] [int] NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[telefon] [nvarchar](11) NOT NULL,
 CONSTRAINT [PK_klient] PRIMARY KEY CLUSTERED 
(
	[kod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[poctavhika]    Script Date: 12.10.2022 20:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[poctavhika](
	[kod_poctavhika] [int] NOT NULL,
	[nazvanie_poctavhika] [nvarchar](50) NOT NULL,
	[telefon] [nvarchar](11) NOT NULL,
 CONSTRAINT [PK_poctavhika] PRIMARY KEY CLUSTERED 
(
	[kod_poctavhika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[poctavka]    Script Date: 12.10.2022 20:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[poctavka](
	[kod_poctavki] [int] NOT NULL,
	[kod_poctavhika] [int] NOT NULL,
	[data_poctavki] [date] NOT NULL,
 CONSTRAINT [PK_poctavka] PRIMARY KEY CLUSTERED 
(
	[kod_poctavki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tovar]    Script Date: 12.10.2022 20:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tovar](
	[kod_tovara] [int] NOT NULL,
	[kod_poctavki] [int] NOT NULL,
	[nazvanie_tovara] [nvarchar](50) NOT NULL,
	[ctoimoct] [int] NOT NULL,
 CONSTRAINT [PK_tovar] PRIMARY KEY CLUSTERED 
(
	[kod_tovara] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12.10.2022 20:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zakazi]    Script Date: 12.10.2022 20:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zakazi](
	[kod_zakaza] [int] NOT NULL,
	[kod_cotrydnika] [int] NOT NULL,
	[kod_tovara] [int] NOT NULL,
	[data_razmehemia] [date] NOT NULL,
	[kod_klienta] [int] NOT NULL,
	[CotrydnicID] [int] NOT NULL,
 CONSTRAINT [PK_zakazi] PRIMARY KEY CLUSTERED 
(
	[kod_zakaza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cotrydnic]  WITH CHECK ADD  CONSTRAINT [FK_Cotrydnic_Doljnoct] FOREIGN KEY([DoljnoctID])
REFERENCES [dbo].[Doljnoct] ([DoljnoctID])
GO
ALTER TABLE [dbo].[Cotrydnic] CHECK CONSTRAINT [FK_Cotrydnic_Doljnoct]
GO
ALTER TABLE [dbo].[Cotrydnic]  WITH CHECK ADD  CONSTRAINT [FK_Cotrydnic_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Cotrydnic] CHECK CONSTRAINT [FK_Cotrydnic_User]
GO
ALTER TABLE [dbo].[poctavka]  WITH CHECK ADD  CONSTRAINT [FK_poctavka_poctavhika] FOREIGN KEY([kod_poctavhika])
REFERENCES [dbo].[poctavhika] ([kod_poctavhika])
GO
ALTER TABLE [dbo].[poctavka] CHECK CONSTRAINT [FK_poctavka_poctavhika]
GO
ALTER TABLE [dbo].[tovar]  WITH CHECK ADD  CONSTRAINT [FK_tovar_poctavka] FOREIGN KEY([kod_poctavki])
REFERENCES [dbo].[poctavka] ([kod_poctavki])
GO
ALTER TABLE [dbo].[tovar] CHECK CONSTRAINT [FK_tovar_poctavka]
GO
ALTER TABLE [dbo].[zakazi]  WITH CHECK ADD  CONSTRAINT [FK_zakazi_Cotrydnic] FOREIGN KEY([CotrydnicID])
REFERENCES [dbo].[Cotrydnic] ([CotrydnicID])
GO
ALTER TABLE [dbo].[zakazi] CHECK CONSTRAINT [FK_zakazi_Cotrydnic]
GO
ALTER TABLE [dbo].[zakazi]  WITH CHECK ADD  CONSTRAINT [FK_zakazi_klient] FOREIGN KEY([kod_klienta])
REFERENCES [dbo].[klient] ([kod])
GO
ALTER TABLE [dbo].[zakazi] CHECK CONSTRAINT [FK_zakazi_klient]
GO
ALTER TABLE [dbo].[zakazi]  WITH CHECK ADD  CONSTRAINT [FK_zakazi_tovar] FOREIGN KEY([kod_tovara])
REFERENCES [dbo].[tovar] ([kod_tovara])
GO
ALTER TABLE [dbo].[zakazi] CHECK CONSTRAINT [FK_zakazi_tovar]
GO
