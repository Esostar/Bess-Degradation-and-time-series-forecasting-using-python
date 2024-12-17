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
LIMIT 1;
