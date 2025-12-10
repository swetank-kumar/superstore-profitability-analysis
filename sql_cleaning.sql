#SUPERSTORE PROJECT :

-- 1. Creating the Database
CREATE DATABASE IF NOT EXISTS superstore_project;
USE superstore_project;

-- 2. Creating the "Raw" Staging Table

DROP TABLE IF EXISTS raw_superstore_data;
CREATE TABLE raw_superstore_data (
    Row_ID VARCHAR(500),                 
    Order_ID VARCHAR(500),
    Order_Date VARCHAR(500),       
    Ship_Date VARCHAR(500),        
    Ship_Mode VARCHAR(500),
    Customer_ID VARCHAR(500),
    Customer_Name VARCHAR(500),
    Segment VARCHAR(500),
    Country VARCHAR(500),
    City VARCHAR(500),
    State VARCHAR(500),
    Postal_Code VARCHAR(500),       
    Region VARCHAR(500),
    Product_ID VARCHAR(500),
    Category VARCHAR(500),
    Sub_Category VARCHAR(500),
    Product_Name VARCHAR(500),           
    Sales VARCHAR(500),            
    Quantity VARCHAR(500),
    Discount VARCHAR(500),         
    Profit VARCHAR(500)         
);

select count(*)
from raw_superstore_data;

-- 3. Setup the Final Target Table

DROP TABLE IF EXISTS cleaned_superstore;
CREATE TABLE cleaned_superstore (
    
    Row_ID INT,
    Order_ID VARCHAR(50),
    Customer_ID VARCHAR(50),  
    Product_ID VARCHAR(50),    
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),     
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255), 
    Sales DECIMAL(10,2),
    Quantity INT,
    Profit DECIMAL(10,2),
    Discount DECIMAL(4,2),
    
    -- Calculated columns (We create them here but fill them later)
    Unit_Price DECIMAL(10,2),
    Margin_Pct DECIMAL(10,4),
    Order_Year INT
);

-- 4. Inserting Data 

INSERT INTO cleaned_superstore (
    Row_ID, Order_ID, Customer_ID, Product_ID,
    Order_Date, Ship_Date, 
    Ship_Mode, Customer_Name, Segment, Country, City, State, Postal_Code, Region, 
    Category, Sub_Category, Product_Name,
    Sales, Quantity, Profit, Discount
)
SELECT 
    CAST(Row_ID AS UNSIGNED),
    Order_ID,
    Customer_ID,
    Product_ID,
    
    -- Fix Dates
    STR_TO_DATE(Order_Date, '%m/%d/%Y'),
    STR_TO_DATE(Ship_Date, '%m/%d/%Y'),
    
    Ship_Mode,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Postal_Code,
    Region,
    Category,
    Sub_Category,
    Product_Name,
    
    -- Fix Numbers
    CAST(Sales AS DECIMAL(10,2)),
    CAST(Quantity AS UNSIGNED),
    CAST(Profit AS DECIMAL(10,2)),
    CAST(Discount AS DECIMAL(4,2))
FROM raw_superstore_data;

-- 5. Setting our calculated columns

UPDATE cleaned_superstore
SET 
    Unit_Price = Sales / NULLIF(Quantity, 0),
    Margin_Pct = Profit / NULLIF(Sales, 0),
    Order_Year = YEAR(Order_Date);
-- 6. Created a new column profit status for our chart
ALTER TABLE cleaned_superstore
ADD COLUMN Profit_Status VARCHAR(20);
UPDATE cleaned_superstore
SET Profit_Status = CASE 
    WHEN Profit < 0 THEN 'Loss' 
    ELSE 'Profit' 
END;

-- 7. Verify
select count(*)
from cleaned_superstore;
SELECT *
  FROM cleaned_superstore;
  
-- END--