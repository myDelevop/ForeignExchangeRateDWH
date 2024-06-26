/*
Run the following script on the localhost (or servername) instance in the SQL Server DB.
This allows us to create the databases in SQL Server that will contain our datawarehouse.

Another important think, it should be enable the login with username and password rather
than the Windows authentication in order to create connectors from Visual Studio
*/

CREATE DATABASE IM_FX_EXCHANGE;
CREATE DATABASE SA_FX_EXCHANGE;
CREATE DATABASE DM_FX_EXCHANGE;


USE [master]
GO
CREATE LOGIN [fxUserDWH] WITH PASSWORD=N'fxUserDWH', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [fxUserDWH]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [fxUserDWH]

use [tempdb];
GO
USE [DM_FX_EXCHANGE]
GO
CREATE USER [fxUserDWH] FOR LOGIN [fxUserDWH]
GO
use [DM_FX_EXCHANGE];
GO
USE [IM_FX_EXCHANGE]
GO
CREATE USER [fxUserDWH] FOR LOGIN [fxUserDWH]
GO
use [IM_FX_EXCHANGE];
GO
USE [master]
GO
CREATE USER [fxUserDWH] FOR LOGIN [fxUserDWH]
GO
use [master];
GO
USE [model]
GO
CREATE USER [fxUserDWH] FOR LOGIN [fxUserDWH]
GO
use [model];
GO
USE [msdb]
GO
CREATE USER [fxUserDWH] FOR LOGIN [fxUserDWH]
GO
use [msdb];
GO
USE [SA_FX_EXCHANGE]
GO
CREATE USER [fxUserDWH] FOR LOGIN [fxUserDWH]
GO
use [SA_FX_EXCHANGE];
GO
USE [tempdb]
GO
CREATE USER [fxUserDWH] FOR LOGIN [fxUserDWH]
GO



/* DDL FOR TABLES */
USE IM_FX_EXCHANGE; 

CREATE TABLE A_FX_EXCHANGE_TT_RATES_SAMPLE (
	eventId BIGINT,
	eventTime BIGINT,
	ccyCouple VARCHAR(6),
	rate FLOAT
);

CREATE TABLE A_FX_EXCHANGE_E_RATES_SAMPLE (
date datetime,
sourceError varchar(120),
errorMessage varchar(600));


USE SA_FX_EXCHANGE;

CREATE TABLE [dbo].[A_FX_EXCHANGE_S_CURRENCY](
	CurrencyIds int IDENTITY(1,1) NOT NULL,
	Name varchar(3),
	Description varchar(23) NOT NULL
)

CREATE TABLE [dbo].[A_FX_EXCHANGE_S_DATETIME](
	DatetimeIds int IDENTITY(1,1) NOT NULL,
	eventTime bigint NULL,
	Datetime datetime NULL,
	Date date NULL,
	Year int NULL,
	Month int NULL,
	Day int NULL,
	Semester int NOT NULL,
	Quarter int NULL
)


CREATE TABLE [dbo].[B_FX_EXCHANGE_SF_SAMPLE_RATE] (
	eventIds int,
	eventId bigint,
	eventTimeIds int,
	baseCurrencyIds int,
	quoteCurrencyIds int,
	rate float
)

CREATE TABLE [dbo].[B_FX_EXCHANGE_SF_CURRENCY_RATE] (
	baseCurrencyIds int,
	quoteCurrencyIds int,
	currentRate float,
	yesterdayNYTimeChange float
)





USE DM_FX_EXCHANGE;


SELECT * 
INTO [dbo].[A_FX_EXCHANGE_L_CURRENCY] 
FROM SA_FX_EXCHANGE..A_FX_EXCHANGE_S_CURRENCY 
WHERE 1=0;


SELECT * 
INTO [dbo].[A_FX_EXCHANGE_L_DATETIME]
FROM SA_FX_EXCHANGE..A_FX_EXCHANGE_S_DATETIME 
WHERE 1=0;


SELECT *
INTO [dbo].[B_FX_EXCHANGE_F_SAMPLE_RATE]
FROM SA_FX_EXCHANGE..B_FX_EXCHANGE_SF_SAMPLE_RATE 
WHERE 1=0;

SELECT * 
INTO [dbo].[B_FX_EXCHANGE_F_CURRENCY_RATE]
FROM SA_FX_EXCHANGE..B_FX_EXCHANGE_SF_CURRENCY_RATE 
WHERE 1=0;