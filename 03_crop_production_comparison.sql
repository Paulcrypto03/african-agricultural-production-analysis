-- Project: African Agricultural Production Analysis
-- Source: FAOSTAT
-- Purpose: Compare crop production in 2000 and 2024
-- Crops: Cassava, maize, and rice
-- Metric: Percentage change in recorded production


SELECT COUNT(*) AS total_records
FROM faostat_crop_data;

SELECT *
FROM faostat_crop_data
LIMIT 10;

SELECT
    SUM(CASE WHEN Area IS NULL OR Area = '' THEN 1 ELSE 0 END) AS missing_country,
    SUM(CASE WHEN Item IS NULL OR Item = '' THEN 1 ELSE 0 END) AS missing_crop,
    SUM(CASE WHEN Year IS NULL THEN 1 ELSE 0 END) AS missing_year,
    SUM(CASE WHEN Element IS NULL OR Element = '' THEN 1 ELSE 0 END) AS missing_element,
    SUM(CASE WHEN Value IS NULL THEN 1 ELSE 0 END) AS missing_value
FROM faostat_crop_data;


SELECT
    `Area`,
    `Item`,
    `Element`,
    `Year`,
    `Value`,
    `Flag`,
    `Flag Description`,
    COUNT(*) AS record_count
FROM faostat_crop_data
GROUP BY
    `Area`,
    `Item`,
    `Element`,
    `Year`,
    `Value`,
    `Flag`,
    `Flag Description`
HAVING COUNT(*) > 1;


SELECT
    MIN(`Year`) AS first_year,
    MAX(`Year`) AS last_year,
    COUNT(DISTINCT `Year`) AS number_of_years
FROM faostat_crop_data;

SELECT *
FROM faostat_crop_data;

SELECT item,
	SUM(Value) AS total_production
    FROM faostat_crop_data
    WHERE Element = 'Production'
    GROUP BY item
    ORDER BY total_production DESC;
    
    SELECT 
		Area AS Country,
        SUM(Value) As total_cassava_production
        FROM faostat_crop_data
        WHERE Element = 'Production'
        AND Item = 'Cassava, fresh'
	    GROUP BY Area
        ORDER BY  total_cassava_production DESC;
        
SELECT DISTINCT `Area`
	FROM faostat_crop_data
	ORDER BY `Area`;
        
        
SELECT *
	FROM faostat_crop_data;
    
    SELECT Area,Item,Element,COUNT(*) AS total_records
    FROM faostat_crop_data
    WHERE Area LIKE '%Mauritania%'
    GROUP BY Area,Item,Element
    ORDER BY Item,Element;
    
    SELECT item,
		SUM(Value) AS total_production_count
        FROM faostat_crop_data
        WHERE Element = 'Production'
        GROUP BY Item
        ORDER BY total_production_count DESC ;
        
        SELECT Year,
			SUM(Value) as total_production_count
            FROM faostat_crop_data
            WHERE Element = 'Production'
            AND Item = 'Cassava, fresh'
            GROUP BY Year
            ORDER BY total_production_count DESC;
            
            
		SELECT
    `Area` AS country,
    SUM(
        CASE WHEN `Year` = 2000
        THEN `Value` ELSE 0 END
    ) AS production_2000,
    SUM(
        CASE WHEN `Year` = 2024
        THEN `Value` ELSE 0 END
    ) AS production_2024
FROM faostat_crop_data
WHERE `Element` = 'Production'
  AND `Item` = 'Cassava, fresh'
  AND `Year` IN (2000, 2024)
GROUP BY `Area`
ORDER BY production_2024 DESC;


SELECT
    `Area` AS country,
    SUM(CASE WHEN `Year` = 2000
        THEN `Value` ELSE 0 END) AS production_2000,
    SUM(CASE WHEN `Year` = 2024
        THEN `Value` ELSE 0 END) AS production_2024,
    ROUND(
        (
            SUM(CASE WHEN `Year` = 2024
                THEN `Value` ELSE 0 END)
            -
            SUM(CASE WHEN `Year` = 2000
                THEN `Value` ELSE 0 END)
        )
        /
        NULLIF(
            SUM(CASE WHEN `Year` = 2000
                THEN `Value` ELSE 0 END), 0
        ) * 100,
        2
    ) AS percentage_change
FROM faostat_crop_data
WHERE `Element` = 'Production'
  AND `Item` = 'Cassava, fresh'
  AND `Year` IN (2000, 2024)
GROUP BY `Area`
ORDER BY percentage_change DESC;
    
 SELECT
    `Area` AS country,
    SUM(CASE WHEN `Year` = 2000
        THEN `Value` ELSE 0 END) AS production_2000,
    SUM(CASE WHEN `Year` = 2024
        THEN `Value` ELSE 0 END) AS production_2024,
    ROUND(
        (
            SUM(CASE WHEN `Year` = 2024
                THEN `Value` ELSE 0 END)
            -
            SUM(CASE WHEN `Year` = 2000
                THEN `Value` ELSE 0 END)
        )
        /
        NULLIF(
            SUM(CASE WHEN `Year` = 2000
                THEN `Value` ELSE 0 END), 0
        ) * 100,
        2
    ) AS percentage_change
FROM faostat_crop_data
WHERE `Element` = 'Production'
  AND `Item` = 'Cassava, fresh'
  AND `Year` IN (2000, 2024)
GROUP BY `Area`
ORDER BY percentage_change DESC; 

SHOW COLUMNS FROM faostat_crop_data;  

ALTER TABLE faostat_crop_data
RENAME COLUMN `ï»¿Domain Code` TO `Domain Code`;

UPDATE faostat_crop_data
SET Area = 'Côte d''Ivoire'
WHERE Area = 'CÃ´te d''Ivoire';

SELECT DISTINCT Area
FROM faostat_crop_data
WHERE Area LIKE '%Ivoire%';

SELECT
    `Area` AS country,
    SUM(CASE WHEN `Year` = 2000
        THEN `Value` ELSE 0 END) AS production_2000,
    SUM(CASE WHEN `Year` = 2024
        THEN `Value` ELSE 0 END) AS production_2024
FROM faostat_crop_data
WHERE `Element` = 'Production'
  AND `Item` = 'Maize (corn)'
  AND `Year` IN (2000, 2024)
GROUP BY `Area`
ORDER BY production_2024 DESC;

SELECT
    `Area` AS country,
    SUM(CASE WHEN `Year` = 2000
        THEN `Value` ELSE 0 END) AS production_2000,
    SUM(CASE WHEN `Year` = 2024
        THEN `Value` ELSE 0 END) AS production_2024,
    ROUND(
        (
            SUM(CASE WHEN `Year` = 2024
                THEN `Value` ELSE 0 END)
            -
            SUM(CASE WHEN `Year` = 2000
                THEN `Value` ELSE 0 END)
        )
        / NULLIF(
            SUM(CASE WHEN `Year` = 2000
                THEN `Value` ELSE 0 END), 0
        ) * 100,
        2
    ) AS percentage_change
FROM faostat_crop_data
WHERE `Element` = 'Production'
  AND `Item` = 'Maize (corn)'
  AND `Year` IN (2000, 2024)
GROUP BY `Area`
ORDER BY percentage_change DESC;

SELECT
    `Area`,
    `Year`,
    `Value`,
    `Flag`,
    `Flag Description`,
    `Note`
FROM faostat_crop_data
WHERE `Area` = 'Cabo Verde'
  AND `Item` = 'Maize (corn)'
  AND `Element` = 'Production'
  AND `Year` IN (2000, 2024)
ORDER BY `Year`;

SELECT
    `Year`,
    `Value` AS maize_production,
    `Flag Description`
FROM faostat_crop_data
WHERE `Area` = 'Cabo Verde'
  AND `Item` = 'Maize (corn)'
  AND `Element` = 'Production'
ORDER BY `Year`;


SELECT
    `Area` AS country,
    SUM(CASE WHEN `Year` = 2000
        THEN `Value` ELSE 0 END) AS production_2000,
    SUM(CASE WHEN `Year` = 2024
        THEN `Value` ELSE 0 END) AS production_2024
FROM faostat_crop_data
WHERE `Element` = 'Production'
  AND `Item` = 'Rice'
  AND `Year` IN (2000, 2024)
GROUP BY `Area`
ORDER BY production_2024 DESC;
        
        SELECT
    `Area` AS country,
    SUM(CASE WHEN `Year` = 2000
        THEN `Value` ELSE 0 END) AS production_2000,
    SUM(CASE WHEN `Year` = 2024
        THEN `Value` ELSE 0 END) AS production_2024,
    ROUND(
        (
            SUM(CASE WHEN `Year` = 2024
                THEN `Value` ELSE 0 END)
            -
            SUM(CASE WHEN `Year` = 2000
                THEN `Value` ELSE 0 END)
        )
        / NULLIF(
            SUM(CASE WHEN `Year` = 2000
                THEN `Value` ELSE 0 END), 0
        ) * 100,
        2
    ) AS percentage_change
FROM faostat_crop_data
WHERE `Element` = 'Production'
  AND `Item` = 'Rice'
  AND `Year` IN (2000, 2024)
GROUP BY `Area`
ORDER BY percentage_change DESC;


SELECT
    `Area` AS country,
    `Item` AS crop,
    SUM(CASE WHEN `Year` = 2000
        THEN `Value` ELSE 0 END) AS production_2000,
    SUM(CASE WHEN `Year` = 2024
        THEN `Value` ELSE 0 END) AS production_2024,
    ROUND(
        (
            SUM(CASE WHEN `Year` = 2024
                THEN `Value` ELSE 0 END)
            -
            SUM(CASE WHEN `Year` = 2000
                THEN `Value` ELSE 0 END)
        ) / NULLIF(
            SUM(CASE WHEN `Year` = 2000
                THEN `Value` ELSE 0 END), 0
        ) * 100,
        2
    ) AS percentage_change
FROM faostat_crop_data
WHERE `Element` = 'Production'
  AND `Year` IN (2000, 2024)
GROUP BY `Area`, `Item`
HAVING COUNT(DISTINCT `Year`) = 2
ORDER BY crop, percentage_change DESC;