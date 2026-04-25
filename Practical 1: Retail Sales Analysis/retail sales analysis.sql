SELECT *  FROM `practical3-493418.25042026.retail_sales` LIMIT 1000;


-- a) Filter all transactions that occurred in the year 2023.
SELECT *
FROM `practical3-493418.25042026.retail_sales`
WHERE Extract(YEAR FROM Date) = 2023;


-- b) Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.
SELECT  AVG(`Total Amount`) AS avg_amount
FROM `practical3-493418.25042026.retail_sales`;

SELECT * 
FROM `practical3-493418.25042026.retail_sales`
WHERE `Total Amount` > 455.9999999999;


-- c) Calculate the total revenue (sum of Total Amount)
SELECT SUM(`Total Amount`) AS total_revenue
FROM `practical3-493418.25042026.retail_sales`;


-- d) Display all distinct Product Categories in the dataset.
SELECT DISTINCT `Product Category`
FROM `practical3-493418.25042026.retail_sales`;


-- e) For each Product Category, calculate the total quantity sold.
SELECT `Product Category`,
        SUM(Quantity) AS total_quantity
FROM `practical3-493418.25042026.retail_sales`
GROUP BY `Product Category`;


-- f) Create a column called Age_Group that classifies customers as: – 'Youth' (<30); – 'Adult' (30–59); – 'Senior' (60+)
SELECT `Customer ID`,
        Age,
        CASE
            WHEN Age < 30 THEN 'Youth'
            WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
            ELSE 'Senior'
        END AS Age_Group
FROM `practical3-493418.25042026.retail_sales`;


-- g) For each Gender, count how many high-value transactions occurred (where Total Amount > 500).
SELECT Gender,
        COUNT(`Total Amount` > 500) AS high_value_transactions
FROM `practical3-493418.25042026.retail_sales`
GROUP BY Gender;
            

-- h) For each Product Category, show only those categories where the total revenue exceeds 5,000.
SELECT `Product Category`,
        SUM(`Total Amount`) AS Total_Revenue
FROM `practical3-493418.25042026.retail_sales`
GROUP BY `Product Category`
HAVING Total_Revenue > 5000;


-- i) Display a new column called Unit_Cost_Category that labels a transaction as:
--  – 'Cheap' if Price per Unit < 50
--  – 'Moderate' if Price per Unit between 50 and 200
--  – 'Expensive' if Price per Unit > 200
SELECT `Transaction ID`,
        `Price per Unit`,
        CASE
            WHEN `Price per Unit` < 50 THEN 'Cheap'
            WHEN `Price per Unit` BETWEEN 50 AND 200 THEN ' Moderate'
            WHEN `Price per Unit` > 200 THEN 'Expensive'
        END AS Unit_Cost_Category
FROM `practical3-493418.25042026.retail_sales`;


-- j) Display all transactions from customers aged 40 or older and add a column Spending_Level showing:
--  – 'High' if Total Amount > 1000
--  – 'Low' otherwise
SELECT `Customer ID`,
        Age,
        `Total Amount`,
        CASE
            WHEN `Total Amount` > 1000 THEN 'High'
            ELSE 'Low'
        END AS Spending_Level
FROM `practical3-493418.25042026.retail_sales`
WHERE Age > 40;



