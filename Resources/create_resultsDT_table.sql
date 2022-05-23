USE weather;
GO

-- check for max length's on character columns and adjust redefined table accordingly.
SELECT 
MAX(LEN(weather_description)),
MAX(LEN(weather_description_two_prediction)),
MAX(LEN(weather_description_five)),
MAX(LEN(weather_description_two))
FROM [results];
/*
(No column name)	(No column name)	(No column name)	(No column name)
32					5					6					 5
*/


-- copy the original data into the new table
SELECT 
	[datetime]
    ,[Humidity]
    ,[Pressure]
    ,[Temperature]
    ,[Weather_Description]
    ,[Wind_Direction]
    ,[Wind_speed]
    ,[Weather_Description_two_Prediction]
    ,[Weather_Description_Five]
    ,[Weather_Description_two]
    ,[Dropped]
INTO [dbo].[resultsDT]
FROM [dbo].[Results];
/*
(45253 rows affected)
duration 00:00:08
Completion time: 2022-05-18T21:18:05.7205520-04:00
*/

SELECT TOP 2000 *
FROM [resultsDT] ;

-- address the empty cells and make sure they show up as NULLs
UPDATE [resultsDT] SET Humidity = NULL WHERE Humidity = ''; -- (589 rows affected)
UPDATE [resultsDT] SET pressure = NULL WHERE pressure = ''; -- (3 rows affected)
UPDATE [resultsDT] SET temperature = NULL WHERE temperature = ''; --(3 rows affected)
UPDATE [resultsDT] SET weather_description = NULL WHERE weather_description = ''; -- (1 row affected)
UPDATE [resultsDT] SET wind_direction = NULL WHERE wind_direction = ''; -- (1 row affected)
UPDATE [resultsDT] SET wind_speed = NULL WHERE wind_speed = ''; -- (2 rows affected)
UPDATE [resultsDT] SET weather_description_two_prediction = NULL WHERE weather_description_two_prediction = ''; -- (5235 rows affected)
UPDATE [resultsDT] SET weather_description_five = NULL WHERE weather_description_five = ''; -- (5235 rows affected)
UPDATE [resultsDT] SET weather_description_two = NULL WHERE weather_description_two = ''; -- (5235 rows affected)

-- double check random selection of records
SELECT TOP 2000 * FROM [resultsDT] order by checksum(newid());

-- Alter numeric columns
ALTER TABLE [dbo].[resultsDT] ALTER COLUMN [humidity] NUMERIC(4,1); -- Commands completed successfully.
ALTER TABLE [dbo].[resultsDT] ALTER COLUMN [pressure] NUMERIC(5,1); -- Commands completed successfully.
ALTER TABLE [dbo].[resultsDT] ALTER COLUMN [temperature] NUMERIC(6,3); -- Commands completed successfully.
ALTER TABLE [dbo].[resultsDT] ALTER COLUMN [wind_direction] NUMERIC(4,1); -- Commands completed successfully.

-- check wind speed values
select distinct wind_speed from resultsDT;
ALTER TABLE [dbo].[resultsDT] ALTER COLUMN [wind_speed] NUMERIC(3,1); -- Commands completed successfully.

-- alter the remaining columns
ALTER TABLE [dbo].[resultsDT] ALTER COLUMN [weather_description_two_prediction] [varchar](5); -- Commands completed successfully.
ALTER TABLE [dbo].[resultsDT] ALTER COLUMN [weather_description_five] [varchar](6); -- Commands completed successfully.
ALTER TABLE [dbo].[resultsDT] ALTER COLUMN [weather_description_two] [varchar](5); -- Commands completed successfully.
ALTER TABLE [dbo].[resultsDT] ALTER COLUMN [dropped] bit;  -- Commands completed successfully.
ALTER TABLE [dbo].[resultsDT] ALTER COLUMN [weather_description] [varchar](35); -- Commands completed successfully.


/*
If you need to drop and recreate the table:

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[resultsDT](
	[datetime] [datetime2](7) NULL,
	[humidity] [numeric](4, 1) NULL,
	[pressure] [numeric](5, 1) NULL,
	[temperature] [numeric](6, 3) NULL,
	[weather_description] [varchar](35) NULL,
	[wind_direction] [numeric](4, 1) NULL,
	[wind_speed] [numeric](3, 1) NULL,
	[weather_description_two_prediction] [varchar](5) NULL,
	[weather_description_five] [varchar](6) NULL,
	[weather_description_two] [varchar](5) NULL,
	[dropped] [bit] NULL
) ON [PRIMARY]
GO
*/