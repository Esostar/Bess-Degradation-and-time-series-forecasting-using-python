SELECT 
    DATE(Timestamp) AS `Date`,
    SUM(`Power Output/Input` * `Market Price`) AS Daily_Revenue
FROM 
    `Energy Analyst_merged_bess_market_data`
GROUP BY 
    `Date`
ORDER BY 
    `Date`;
