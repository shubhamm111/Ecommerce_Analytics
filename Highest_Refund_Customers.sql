-- Customers having the highest number of refund requests
SELECT 
    Customer_ID,
    COUNT(*) AS Total_Refund_Requests
FROM 
    [dbo].[Ecommerce]
WHERE 
    Refund_Requested = 'Yes'
GROUP BY 
    Customer_ID
ORDER BY 
    Total_Refund_Requests DESC;
