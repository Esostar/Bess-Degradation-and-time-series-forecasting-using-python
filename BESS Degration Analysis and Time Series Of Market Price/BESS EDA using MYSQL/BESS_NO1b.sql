SELECT 
    CONCAT(YEAR(Timestamp), '-', MONTH(Timestamp)) AS `Month`,
    SUM(`Power Output/Input` * `Market Price`) AS Monthly_Revenue
FROM 
    `Energy Analyst_merged_bess_market_data`
GROUP BY 
    `Month`
ORDER BY 
    `Month`;
