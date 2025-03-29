-- Identify customers with consistent low service ratings (<=2)

WITH Low_ratings AS (
    SELECT 
        Customer_ID,
        COUNT(*) AS Poor_ratings
    FROM 
        [dbo].[Ecommerce]
    WHERE
        Service_Rating <= 2
    GROUP BY 
        Customer_ID
), 

-- Identify customers with refund requests
Refund_Initiated AS (
    SELECT 
        Customer_ID,
        COUNT(*) AS Total_Refund_Requests
    FROM 
        [dbo].[Ecommerce]
    WHERE 
        Refund_Requested = 'Yes'
    GROUP BY 
        Customer_ID
)
-- Retrieve customers with both low ratings and refund requests

    SELECT 
        L.Customer_ID,
        L.Poor_ratings AS Total_Poor_ratings,
        R.Total_Refund_Requests AS Total_Refund_Requests
    FROM 
        Low_ratings L
    INNER JOIN 
        Refund_Initiated R 
    ON 
        L.Customer_ID = R.Customer_ID 

	ORDER BY 
    Total_Poor_ratings DESC,
    Total_Refund_Requests DESC ; 






