-- Select the Summer SALES database
USE Summer_SALES;

-- Query the original summer table to understand its contents
SELECT * FROM summer;

-- Create a new table summer_data as a copy of the summer table to preserve original data
SELECT * INTO summer_data FROM summer;

-- Verify the contents of the new summer_data table
SELECT * FROM summer_data;