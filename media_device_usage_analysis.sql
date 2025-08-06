-- Project Title : Media Device Usage Trend Analysis (TV vs Mobile)

CREATE DATABASE IF NOT EXISTS media_usage_trends;
USE media_usage_trends;

-- Check for Missing or Null Values
SELECT
     SUM(CASE WHEN Record_ID IS NULL THEN 1 ELSE 0 END) AS null_record_id,
     SUM(CASE WHEN Year IS NULL THEN 1 ELSE 0 END) AS null_year,
     SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS null_region,
     SUM(CASE WHEN TV_Users IS NULL THEN 1 ELSE 0 END) AS null_tv_users,
     SUM(CASE WHEN Mobile_Users IS NULL THEN 1 ELSE 0 END) AS null_mobile_users,
     SUM(CASE WHEN mobile_usage_share_pct IS NULL THEN 1 ELSE 0 END) AS null_mobile_PCT
FROM device_adoption_over_time;

-- Check for Duplicate
SELECT Record_ID, COUNT(*) AS count
FROM device_adoption_over_time
GROUP BY Record_ID
HAVING COUNT(*) > 1;

-- Inconsistent Regions
SELECT DISTINCT Region
FROM device_adoption_over_time
GROUP BY Region;

-- Year Range Issues
SELECT MIN(Year) AS min_year, MAX(Year) AS max_year
FROM device_adoption_over_time;

-- INSIGHTS

-- Total Users by Region & Year 
SELECT 
     Year,
     Region,
     SUM(TV_Users) AS total_tv_users,
     SUM(Mobile_Users) AS total_mobile_users,
     SUM(TV_Users + Mobile_Users) AS total_users
FROM device_adoption_over_time
GROUP BY Year, Region
ORDER BY Year, Region;

-- Cumulative Mobile Users by Region Over Time
WITH region_year_totals AS(
SELECT
     Region,
     Year,
     SUM(Mobile_Users) AS total_mobile_users
FROM device_adoption_over_time
GROUP BY Region, Year)

SELECT
     Region,
     Year,
     SUM(total_mobile_users) OVER (PARTITION BY Region ORDER BY Year) AS cumulative_mobile_users
FROM region_year_totals
GROUP BY Region, Year;

-- Gap Between TV and Mobile Users per Year Region
SELECT
	Region,
    Year,
    ABS(Mobile_Users - TV_Users) AS usage_gap
FROM device_adoption_over_time
ORDER BY usage_gap DESC
LIMIT 10;

-- Recalculated Mobile Share
CREATE OR REPLACE VIEW vw_mobile_share_recalculated AS
SELECT *,
      ROUND((mobile_users / (tv_users + mobile_users)) * 100, 2) AS recalculated_mobile_share_pct
FROM device_adoption_over_time;

SELECT *
FROM vw_mobile_share_recalculated;

-- Average Mobile Share Over Time 
ALTER TABLE device_adoption_over_time
CHANGE COLUMN `Mobile_Usage_Share_%` mobile_usage_share_pct DOUBLE;

SELECT
    Region,
    ROUND(AVG(mobile_usage_share_pct), 2) AS avg_share
FROM device_adoption_over_time
GROUP BY Region
HAVING avg_share > 50
ORDER BY avg_share DESC;

