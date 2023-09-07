--1
SELECT date, SUM(impressions) as ImpressionSum
FROM "marketing_performance"
GROUP BY date

--2
SELECT state,  SUM(revenue)  as revenueSum
FROM "website_revenue"
GROUP BY state
ORDER BY revenueSum DESC
limit 3
--the thrird best state OH, generated 37577 in revenue

--3
SELECT  campaign_info.name , SUM(marketing_performance.cost)  as costSum,  SUM(website_revenue.revenue)  as revenueSum,  SUM(marketing_performance.clicks)  as clickSum, SUM(marketing_performance.impressions)  as impressionSum
FROM marketing_performance
INNER JOIN website_revenue
ON marketing_performance.campaign_id = website_revenue.campaign_id 
INNER JOIN campaign_info
 ON marketing_performance.campaign_id = campaign_info.id
GROUP BY campaign_info.id
ORDER BY name

--4
SELECT geo, marketing_performance.conversions as ConversionSum
FROM "marketing_performance"
WHERE marketing_performance.campaign_id = 99058240
--OH generated the most conversions for campaign5 at 442

--5
--OH was the most effective, with the highest revenuein total and conversions

--6
SELECT DATENAME(dw,marketing_performance.date) as theDayName , SUM(marketing_performance.cost)  as costSum,  SUM(website_revenue.revenue)  as revenueSum,  SUM(marketing_performance.clicks)  as clickSum, SUM(marketing_performance.impressions)  as impressionSum
FROM marketing_performance
INNER JOIN website_revenue
ON marketing_performance.campaign_id = website_revenue.campaign_id 
GROUP BY marketing_performance.date
