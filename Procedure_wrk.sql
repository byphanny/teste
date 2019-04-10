USE [DS_TRAINING]
GO

-- alteração da procedure para teste de commit

/****** Object:  StoredProcedure [dbo].[SP_WRK_CLIENTES]    Script Date: 4/10/2019 12:02:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		STEPHANNY OLIVEIRA
-- Create date: 08/04/2019
-- Description:	CRIA TABELA WRK_CLIENTES
-- =============================================

create PROCEDURE [dbo].[SP_WRK_CLIENTES]

AS
BEGIN

-- =============================================
-- DROP TABLE WRK_CLIENTES
-- =============================================

IF OBJECT_ID('WRK_CLIENTES') IS NOT NULL
DROP TABLE [dbo].[WRK_CLIENTES]

-- =============================================
-- CRIAÇÃO DA TABELA WRK_CLIENTES
-- =============================================
	
	CREATE TABLE WRK_CLIENTES
	(
	[RowNumber]			int identity
	 ,[Customer ID]		varchar(100)		
      ,[City]			varchar(100)
      ,[ZipCode]		varchar(10)
      ,[Gender]			char(1)
      ,[Age]			float
	)

-- =============================================
-- TRUNCATE TABLE
-- =============================================

TRUNCATE TABLE [dbo].[WRK_CLIENTES]

-- =============================================
-- INSERÇÃO DOS DADOS
-- =============================================

INSERT INTO [dbo].[WRK_CLIENTES]
           ([Customer ID]
           ,[City]
           ,[ZipCode]
           ,[Gender]
           ,[Age])
 SELECT 
	   RIGHT('0000000'+ [Customer ID],7)
      ,[City]
      ,[ZipCode]
      ,[Gender]
      ,[Age]
	  FROM [DS_TRAINING].[dbo].[RAW_Clientes_20190408]
		 
END
