-- Load property dataset
SELECT TOP 10 *
FROM Retail..Property;

-- Load sales dataset
SELECT TOP 10 *
FROM Retail..Sales;

-- Load area dataset
SELECT TOP 10 *
FROM Retail..Area;

-- Modify price data type
ALTER TABLE Retail..Sales ALTER COLUMN Price FLOAT;

-- Modify price per unit data type
ALTER TABLE Retail..Sales ALTER COLUMN Price_per_unit_area FLOAT;

-- Looking total property name 
SELECT COUNT(DISTINCT Property_Name) AS total_property
FROM Retail..Property;

-- Looking differences of property
SELECT DISTINCT 
       Property_Name AS Property
FROM Retail..Property;

-- Looking property count
SELECT Property_Name AS Property, 
       COUNT(Property_ID) AS property_count
FROM Retail..Property
WHERE Property_Name != 'NA'
GROUP BY Property_Name
ORDER BY property_count DESC;

-- Looking total property type
SELECT COUNT(DISTINCT Property_type) AS total_property_type
FROM Retail..Property;

-- Looking differences of property type
SELECT DISTINCT
	   Property_type
FROM Retail..Property;

-- Looking property type count
SELECT Property_type,
	   COUNT(Property_ID) AS property_type_count
FROM Retail..Property
GROUP BY Property_type
ORDER BY property_type_count DESC;

-- Looking total property status
SELECT COUNT(DISTINCT Property_status) AS total_property_status
FROM Retail..Property;

-- Looking differences of property status
SELECT DISTINCT
       Property_status
FROM Retail..Property;

-- Looking property status count
SELECT Property_status,
	   COUNT(Property_ID) AS property_status_count
FROM Retail..Property
WHERE Property_status != 'NA'
GROUP BY Property_status
ORDER BY property_status_count DESC;

-- Looking total furnished status
SELECT COUNT(DISTINCT is_furnished) AS total_furnished_status
FROM Retail..Sales;

-- Looking differences of furnished status
SELECT DISTINCT
	   is_furnished AS Furnished_Status
FROM Retail..Sales;

-- Looking furnished status count
SELECT is_furnished AS Furnished_Status,
	   COUNT(Property_ID) AS furnished_status_count
FROM Retail..Sales
GROUP BY is_furnished
ORDER BY furnished_status_count DESC;

-- Looking total area 
SELECT COUNT(DISTINCT Sub_urban_name) AS total_area
FROM Retail..Area;

-- Looking differences of area
SELECT DISTINCT
	   Sub_urban_name AS Area
FROM Retail..Area;

-- Looking area count
SELECT Sub_urban_name AS Area,
	   COUNT(Sub_urban_ID) AS area_count
FROM Retail..Area
WHERE Sub_urban_name != 'Other'
GROUP BY Sub_urban_name
ORDER BY area_count DESC;

-- Looking total quantity and average price based on property and property type on apartment
SELECT prop.Property_Name AS Property, 
       ROUND(SUM(sls.Price) / SUM(sls.Price_per_unit_area), 0) AS total_quantity, 
       ROUND(AVG(sls.Price), 2) AS avg_price
FROM Retail..Property prop
     INNER JOIN Retail..Sales sls ON prop.Property_ID = sls.Property_ID
     INNER JOIN Retail..Area surb ON sls.Sub_urban_ID = surb.Sub_urban_ID
WHERE Property_type = 'Apartment'
GROUP BY Property_Name;

-- Looking total quantity and average price based on property and property type on residential plot
SELECT prop.Property_Name AS Property, 
       ROUND(SUM(sls.Price) / SUM(sls.Price_per_unit_area), 0) AS total_quantity, 
       ROUND(AVG(sls.Price), 2) AS avg_price
FROM Retail..Property prop
     INNER JOIN Retail..Sales sls ON prop.Property_ID = sls.Property_ID
     INNER JOIN Retail..Area surb ON sls.Sub_urban_ID = surb.Sub_urban_ID
WHERE Property_type = 'Residential Plot'
GROUP BY Property_Name;

-- Looking total quantity and average price based on property and property type on independent floor
SELECT prop.Property_Name AS Property, 
       ROUND(SUM(sls.Price) / SUM(sls.Price_per_unit_area), 0) AS total_quantity, 
       ROUND(AVG(sls.Price), 2) AS avg_price
FROM Retail..Property prop
     INNER JOIN Retail..Sales sls ON prop.Property_ID = sls.Property_ID
     INNER JOIN Retail..Area surb ON sls.Sub_urban_ID = surb.Sub_urban_ID
WHERE Property_type = 'Independent Floor'
GROUP BY Property_Name;

-- Looking total quantity and average price based on property and property type on independent house
SELECT prop.Property_Name AS Property, 
       ROUND(SUM(sls.Price) / SUM(sls.Price_per_unit_area), 0) AS total_quantity, 
       ROUND(AVG(sls.Price), 2) AS avg_price
FROM Retail..Property prop
     INNER JOIN Retail..Sales sls ON prop.Property_ID = sls.Property_ID
     INNER JOIN Retail..Area surb ON sls.Sub_urban_ID = surb.Sub_urban_ID
WHERE Property_type = 'Independent House'
GROUP BY Property_Name;

-- Load property dataset
SELECT TOP 10 *
FROM Retail..Property;

-- Load sales dataset
SELECT TOP 10 *
FROM Retail..Sales;

-- Load builder dataset
SELECT TOP 10 *
FROM Retail..Builder;

-- Looking total builder 
SELECT COUNT(DISTINCT Builder_name) AS total_builder
FROM Retail..Builder;

-- Looking differences of builder
SELECT DISTINCT		
	   Builder_name AS Builder
FROM Retail..Builder;

-- Looking builder count
SELECT Builder_name AS Builder, 
       COUNT(Builder_ID) AS builder_count
FROM Retail..Builder
WHERE builder_ID IS NOT NULL
	  AND Builder_name IS NOT NULL
GROUP BY Builder_name
ORDER BY builder_count DESC;

-- Looking total property building status
SELECT COUNT(DISTINCT Property_building_status) AS total_property_building_status
FROM Retail..Builder;

-- Looking differences of property building status
SELECT DISTINCT
	   Property_building_status
FROM Retail..Builder;

-- Looking property building status count
SELECT Property_building_status, 
       COUNT(Builder_ID) AS property_building_status_count
FROM Retail..Builder
WHERE builder_ID IS NOT NULL
GROUP BY Property_building_status
ORDER BY property_building_status_count DESC;

-- Looking total quantity and average price based on property and property building status on active
SELECT prop.Property_Name AS Property, 
       ROUND(SUM(sls.Price) / SUM(sls.Price_per_unit_area), 0) AS total_quantity, 
       ROUND(AVG(sls.Price), 2) AS avg_price
FROM Retail..Property prop
     INNER JOIN Retail..Sales sls ON prop.Property_ID = sls.Property_ID
     INNER JOIN Retail..Builder bld ON sls.builder_ID = bld.builder_ID
WHERE Property_building_status = 'ACTIVE'
GROUP BY Property_Name;

-- Looking total quantity and average price based on property and property building status on inactive
SELECT prop.Property_Name AS Property, 
       ROUND(SUM(sls.Price) / SUM(sls.Price_per_unit_area), 0) AS total_quantity, 
       ROUND(AVG(sls.Price), 2) AS avg_price
FROM Retail..Property prop
     INNER JOIN Retail..Sales sls ON prop.Property_ID = sls.Property_ID
     INNER JOIN Retail..Builder bld ON sls.builder_ID = bld.builder_ID
WHERE Property_building_status = 'INACTIVE'
GROUP BY Property_Name;

-- Looking total quantity and average price based on property and property building status on unverified
SELECT prop.Property_Name AS Property, 
       ROUND(SUM(sls.Price) / SUM(sls.Price_per_unit_area), 0) AS total_quantity, 
       ROUND(AVG(sls.Price), 2) AS avg_price
FROM Retail..Property prop
     INNER JOIN Retail..Sales sls ON prop.Property_ID = sls.Property_ID
     INNER JOIN Retail..Builder bld ON sls.builder_ID = bld.builder_ID
WHERE Property_building_status = 'UNVERIFIED'
GROUP BY Property_Name;

-- Load property dataset
SELECT TOP 10 *
FROM Retail..Property;

-- Load sales dataset
SELECT TOP 10 *
FROM Retail..Sales;

-- Load city dataset
SELECT TOP 10 *
FROM Retail..City;

-- Looking total city
SELECT COUNT(DISTINCT City_name) AS total_city
FROM Retail..City;

-- Looking differences of city
SELECT DISTINCT
	   City_name AS City
FROM Retail..City;

-- Looking city count
SELECT City_name AS City, 
       COUNT(City_ID) AS city_count
FROM Retail..City
GROUP BY City_name
ORDER BY city_count DESC;

-- Looking total quantity and average price based on city and property status on under construction
SELECT cty.City_name AS City,
	   ROUND(SUM(sls.Price) / SUM(sls.Price_per_unit_area), 0) AS total_quantity,
	   ROUND(AVG(sls.Price), 2) AS avg_price
FROM Retail..Property prop
	 INNER JOIN Retail..Sales sls ON prop.Property_ID = sls.Property_ID
	 INNER JOIN Retail..City cty ON sls.City_ID = cty.City_ID
WHERE Property_status = 'Under Construction'
GROUP BY City_name;

-- Looking total quantity and average price based on city and property status on ready to move
SELECT cty.City_name AS City,
	   ROUND(SUM(sls.Price) / SUM(sls.Price_per_unit_area), 0) AS total_quantity,
	   ROUND(AVG(sls.Price), 2) AS avg_price
FROM Retail..Property prop
	 INNER JOIN Retail..Sales sls ON prop.Property_ID = sls.Property_ID
	 INNER JOIN Retail..City cty ON sls.City_ID = cty.City_ID
WHERE Property_status = 'Ready to move'
GROUP BY City_name;