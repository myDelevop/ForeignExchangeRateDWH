/*
Run the following script on the locahost (or servername) instance in the SQL Server DB.
This allow us to create the databases in SQL Server that will contain our datawarehouse.

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
