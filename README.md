# 📊 Media Device Usage Trend Analysis (TV vs Mobile)

This SQL-based project investigates the shift in user preference from traditional television to mobile media consumption across global regions from 2010 to 2019. It includes detailed SQL queries, data cleaning, view creation, and trend insights.

---

## 📁 Project Files

| File Name                                 | Description                                     |
|------------------------------------------|-------------------------------------------------|
| `media_device_usage_analysis.sql`        | Main SQL script with queries & insights         |
| `media_usage_trends_device_adoption_over_time.sql` | SQL dump file for MySQL database import         |
| `mobile_vs_tv_users.csv`                 | Cleaned CSV used to create MySQL table          |

---

## 🧰 Tools Used

- **MySQL** – for querying and logic building   
- **GitHub** – for version control and sharing  

---

## 📊 Dataset Fields

| Column Name               | Description                                |
|--------------------------|--------------------------------------------|
| Record_ID                | Unique identifier                          |
| Year                     | Year of observation                        |
| Region                   | Global region                              |
| TV_Users                 | Number of users watching on TV             |
| Mobile_Users             | Number of users watching on mobile         |
| mobile_usage_share_pct     | Percentage of mobile share                 |

---

## 🔍 Key SQL Features Used

- Data Quality Checks (Nulls, Duplicates)
- Window Functions (`OVER`, `PARTITION BY`)
- Aggregate Metrics (`SUM`, `AVG`, `ROUND`)
- View Creation (`CREATE VIEW`)
- Conditional Logic (`CASE`, `HAVING`)
- CTEs for structured queries

---

## 📌 Sample Insights

1. **Year-wise Total Users by Region**  
2. **Cumulative Mobile Users (Window Function)**  
3. **Gap Analysis: TV vs Mobile**  
4. **Recalculated Mobile Share View**  
5. **Regions with Highest Mobile Share Adoption**

---

## 🧪 How to Use

1. Import `media_usage_trends_device_adoption_over_time.sql` into your MySQL server
2. Run `media_device_usage_analysis.sql` to generate insights and views

---

## 👤 Author

**Navin J**  
Aspiring Data Analyst | Python • SQL • Power BI

---

> 💡 *This project is perfect for portfolio demonstration, SQL interview prep, and BI reporting practice.*
