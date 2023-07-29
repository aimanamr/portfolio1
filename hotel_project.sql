SELECT*
FROM DBO.['2018$']
UNION
SELECT*
FROM DBO.['2019$']
UNION
SELECT*
FROM  DBO.['2020$']

--is the revenues increasing per year??

--create CTE for union table for 3 years

WITH CTEhotels AS (
SELECT*
FROM DBO.['2018$']
UNION
SELECT*
FROM DBO.['2019$']
UNION
SELECT*
FROM  DBO.['2020$'])

select*
from CTEhotels

--no column for revenue, so need to add stay_in_week_nights + stay_in_weekend_nights * adr to get revenue

WITH CTEhotels AS (
SELECT*
FROM DBO.['2018$']
UNION
SELECT*
FROM DBO.['2019$']
UNION
SELECT*
FROM  DBO.['2020$'])

SELECT (stays_in_weekend_nights+stays_in_week_nights) * adr AS revenue
FROM CTEhotels

--ADD arrival_date_year to group revenue by year

WITH CTEhotels AS (
SELECT*
FROM DBO.['2018$']
UNION
SELECT*
FROM DBO.['2019$']
UNION
SELECT*
FROM  DBO.['2020$'])

SELECT arrival_date_year, SUM((stays_in_weekend_nights+stays_in_week_nights) * adr) AS revenue
FROM CTEhotels
GROUP BY arrival_date_year

--add hotel to group revenue by hotel

WITH CTEhotels AS (
SELECT*
FROM DBO.['2018$']
UNION
SELECT*
FROM DBO.['2019$']
UNION
SELECT*
FROM  DBO.['2020$'])

SELECT sum((stays_in_weekend_nights+stays_in_week_nights)) AS totalday
FROM CTEhotels

--calculate total days stay

WITH CTEhotels AS (
SELECT*
FROM DBO.['2018$']
UNION
SELECT*
FROM DBO.['2019$']
UNION
SELECT*
FROM  DBO.['2020$'])

SELECT arrival_date_year, hotel, SUM((stays_in_weekend_nights+stays_in_week_nights) * adr) AS revenue
FROM CTEhotels
GROUP BY arrival_date_year, hotel

--join with market_segment table & meal_cost table

WITH CTEhotels AS (
SELECT*
FROM DBO.['2018$']
UNION
SELECT*
FROM DBO.['2019$']
UNION
SELECT*
FROM  DBO.['2020$'])

SELECT *
FROM CTEhotels
JOIN market_segment$
ON CTEhotels.market_segment = market_segment$.market_segment
JOIN meal_cost$
ON meal_cost$.meal = CTEhotels.meal