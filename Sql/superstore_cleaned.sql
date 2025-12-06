#Superstore Cleaning Project

-- We created a copy of our existing table to make changes 
DROP TABLE IF EXISTS cleaned_superstore;
select count(*) from superstore_data_prep;
-- Run the final CREATE TABLE script without the Primary Key for maximum speed
DROP TABLE IF EXISTS cleaned_superstore;

-- Run the final CREATE TABLE script without the Primary Key for maximum speed

-- Data Cleaning

-- changing The date to mm/dd/yyyy format and data type from text to date

-- For Order Date
ALTER TABLE cleaned_superstore
ADD COLUMN order_date_parsed DATE;
UPDATE cleaned_superstore
SET order_date_parsed = STR_TO_DATE(`Order Date`,'%m/%d/%Y');
UPDATE cleaned_superstore
SET `Order Date` = STR_TO_DATE(`Order Date`,'%m/%d/%Y');
ALTER TABLE cleaned_superstore
DROP `Order Date`,
CHANGE COLUMN order_date_parsed `Order Date` DATE;

-- For Ship Date
ALTER TABLE cleaned_superstore
ADD COLUMN ship_date DATE;
UPDATE cleaned_superstore
SET ship_date = STR_TO_DATE(`Ship Date`,'%m/%d/%Y');
ALTER TABLE cleaned_superstore
DROP `Ship Date`,
CHANGE COLUMN ship_date `Ship Date` DATE;

-- Adding columns
ALTER TABLE superstore_project.cleaned_superstore
ADD COLUMN revenue DOUBLE,
ADD COLUMN unit_price DOUBLE,
ADD COLUMN margin_pct DOUBLE,
ADD COLUMN order_month VARCHAR(7),
ADD COLUMN order_year INT;

-- Updating column with values
UPDATE superstore_project.cleaned_superstore
SET
   revenue = Sales,
   unit_price = Sales/NULLIF(Quantity,0),
   margin_pct = Profit/NULLIF(Sales,0),
   order_month = DATE_FORMAT(`Order Date`,'%Y-%m'),
   order_year = YEAR(`Order Date`)
   ;
SELECT revenue,unit_price,margin_pct,order_month,order_year
FROM cleaned_superstore;
select * 
from cleaned_superstore;
-- End of data 