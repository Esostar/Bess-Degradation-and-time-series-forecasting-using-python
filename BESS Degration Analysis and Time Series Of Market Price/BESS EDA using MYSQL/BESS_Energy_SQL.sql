-- **1. Daily and Monthly Revenue Breakdown**
SELECT 
    DATE(Timestamp) AS `Date`,
    SUM(`Power Output/Input` * `Market Price`) AS Daily_Revenue
FROM 
    `Energy Analyst_merged_bess_market_data`
GROUP BY 
    `Date`
ORDER BY 
    `Date`;

SELECT 
    CONCAT(YEAR(Timestamp), '-', MONTH(Timestamp)) AS `Month`,
    SUM(`Power Output/Input` * `Market Price`) AS Monthly_Revenue
FROM 
    `Energy Analyst_merged_bess_market_data`
GROUP BY 
    `Month`
ORDER BY 
    `Month`;

-- **2. Identification of Days with the Highest and Lowest Efficiency**
-- Assuming "Efficiency" is calculated based on the absolute value of Power Output/Input divided by the total count.
WITH Efficiency_Calculation AS (
    SELECT 
        DATE(Timestamp) AS `Date`,
        SUM(ABS(`Power Output/Input`)) AS Total_Power,
        COUNT(*) AS Total_Records
    FROM 
        `Energy Analyst_merged_bess_market_data`
    WHERE 
        `Power Output/Input` <> 0
    GROUP BY 
        `Date`
)
SELECT 
    `Date`, 
    Total_Power / Total_Records AS Efficiency
FROM 
    Efficiency_Calculation
ORDER BY 
    Efficiency DESC
LIMIT 1; -- Day with Highest Efficiency

SELECT 
    `Date`, 
    Total_Power / Total_Records AS Efficiency
FROM 
    Efficiency_Calculation
ORDER BY 
    Efficiency ASC
LIMIT 1; -- Day with Lowest Efficiency

-- **3. Analysis of Market Price Trends During Peak Shaving Periods**
SELECT 
    DATE(Timestamp) AS `Date`,
    HOUR(Timestamp) AS `Hour`,
    AVG(`Market Price`) AS Average_Market_Price
FROM 
    `Energy Analyst_merged_bess_market_data`
WHERE 
    `Operational Mode` = 'Peak Shaving'
GROUP BY 
    `Date`, `Hour`
ORDER BY 
    `Date`, `Hour`;

-- **4. Calculation of Revenue Loss Due to the Two-Week Calibration Rest Period**
-- Assuming the rest period is from '2024-01-15' to '2024-01-29'
SELECT 
    SUM(`Power Output/Input` * `Market Price`) AS Revenue_Loss
FROM 
    `Energy Analyst_merged_bess_market_data`
WHERE 
    DATE(Timestamp) BETWEEN '2024-01-15' AND '2024-01-29';
