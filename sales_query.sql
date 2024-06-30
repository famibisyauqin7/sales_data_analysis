SELECT
   o.Date AS order_date,
   pc.CategoryName AS category_name,
   p.ProdName AS product_name,
   p.Price AS product_price,
   o.Quantity AS order_qty,
   (p.Price * o.Quantity) AS total_sales,
   c.CustomerEmail AS cust_email,
   c.CustomerCity AS cust_city
FROM
   `bank_muamalat.customers` c
JOIN
   `bank_muamalat.orders` o ON c.customerID = o.customerID
JOIN
   `bank_muamalat.products` p ON o.ProdNumber = p.ProdNumber
JOIN
   `bank_muamalat.productcategory` pc ON p.Category = pc.CategoryID
ORDER BY
   1,
   5,
   2;