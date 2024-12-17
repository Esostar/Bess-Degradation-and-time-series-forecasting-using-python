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
