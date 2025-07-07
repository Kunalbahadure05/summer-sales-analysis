-- Examine the structure of the summer_data table
EXEC sp_help 'summer_data';

-- Modify Price column to DECIMAL(10,2)
ALTER TABLE summer_data
ALTER COLUMN Price DECIMAL(10, 2);

-- Modify Revenue column to DECIMAL(10,2)
ALTER TABLE summer_data
ALTER COLUMN Revenue DECIMAL(10, 2);

-- Modify Time column to TIME(0)
ALTER TABLE summer_data
ALTER COLUMN Time TIME(0);

-- Modify DateTime column to DATE and rename to Date
ALTER TABLE summer_data
ALTER COLUMN DateTime DATE;

EXEC sp_rename 'summer_data.DateTime', 'Date', 'COLUMN';