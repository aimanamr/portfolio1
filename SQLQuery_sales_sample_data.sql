SELECT MONTH_ID, YEAR_ID, SUM(SALES) AS  , COUNTRY
FROM dbo.sales_data_practice$
GROUP BY 



--sales vs year

SELECT SUM (SALES) AS sales_year, YEAR_ID
FROM dbo.sales_data_practice$
GROUP BY YEAR_ID

--sales vs country


SELECT  COUNTRY, SUM (SALES) AS sales_country
FROM dbo.sales_data_practice$
GROUP BY COUNTRY

--SALES VS COUNTRY BY YEAR

SELECT  YEAR_ID,  COUNTRY, SUM (SALES) AS sales_country
FROM dbo.sales_data_practice$
GROUP BY COUNTRY, YEAR_ID
ORDER BY YEAR_ID

--export table to excel

--sales vs city by year

SELECT YEAR_ID, CITY, SUM (SALES) AS sales_city
FROM DBO.sales_data_practice$
GROUP BY CITY, YEAR_ID
ORDER BY YEAR_ID

--NO. OF each PRODUCTLINE SOLD EACH YEAR

SELECT YEAR_ID, SALES, PRODUCTLINE
FROM DBO.sales_data_practice$

SELECT YEAR_ID, PRODUCTLINE, COUNT (PRODUCTLINE) AS count_product
FROM DBO.sales_data_practice$
GROUP BY YEAR_ID, PRODUCTLINE
ORDER BY YEAR_ID

--max PRODUCTLINE SOLD EACH YEAR

SELECT YEAR_ID, PRODUCTCODE, PRODUCTLINE, COUNT (PRODUCTCODE) AS count_code
FROM DBO.sales_data_practice$
GROUP BY YEAR_ID, PRODUCTCODE, PRODUCTLINE
ORDER BY YEAR_ID

--each PRODUCTLINE sales peryear

SELECT YEAR_ID, PRODUCTLINE, SUM (SALES) AS sales_productline
FROM DBO.sales_data_practice$
GROUP BY YEAR_ID, PRODUCTLINE
ORDER BY YEAR_ID

--AVERAGE PRICE EACH PRODUCTLINE

SELECT YEAR_ID, PRODUCTLINE, PRODUCTCODE, AVG(PRICEEACH) AS avg_price
FROM dbo.sales_data_practice$
GROUP BY YEAR_ID, PRODUCTLINE, PRODUCTCODE
ORDER BY avg_price

SELECT YEAR_ID, PRODUCTLINE, PRODUCTCODE, PRICEEACH
FROM dbo.sales_data_practice$

--order status shipment
SELECT YEAR_ID, STATUS, COUNT (STATUS) AS order_status
FROM dbo.sales_data_practice$
GROUP BY YEAR_ID, STATUS

--percent shipment 'shipped' each year

SELECT YEAR_ID, COUNT (STATUS) AS order_status_shipped
FROM dbo.sales_data_practice$
WHERE STATUS = 'Shipped'
GROUP BY YEAR_ID

SELECT YEAR_ID, COUNT (STATUS) AS order_status_all
FROM dbo.sales_data_practice$
GROUP BY YEAR_ID

SELECT YEAR_ID, 
	((SELECT COUNT (STATUS)
			FROM dbo.sales_data_practice$
			WHERE STATUS = 'Shipped')/ COUNT (STATUS)) * 100  AS percent_shipped
FROM dbo.sales_data_practice$
GROUP BY YEAR_ID