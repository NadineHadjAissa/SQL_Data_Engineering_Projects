-- .read Build_Marts.Sql

-- Step 1: DW - Create star schema tables
.read 01_Create_Tables_Dw.sql
-- Step 2: DW - Load data from CSV files into star schema
.read 02_Load_Schema_Dw.sql
-- Step 3: Mart - Create flat mart (denormalized table)
.read 03_Create_Flat_Mart.sql
-- Step 4: Mart - Create skills demand mart
.read 04_Create_Skills_Mart.sql

-- Step 5: Mart - Create priority mart
.read 05_Create_Priority_Mart.sql

-- Step 6: Mart - Update priority mart
.read 06_Update_Priority_Mart.sql

-- Step 7: Mart - Create company prospecting mart
.read 07_Create_Company_Mart.sql

-- Final verification
SELECT '=== Pipeline Build Complete ===' AS status;
SELECT 'All warehouse tables and marts created successfully' AS message;