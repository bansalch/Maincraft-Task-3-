# 📊 Superstore Data Analytics & Business Intelligence Project

## 📌 Project Overview
This project presents a complete end-to-end Data Analytics and Business Intelligence workflow using the Superstore dataset.

The objective was to analyze sales performance, profitability, customer behavior, and regional trends to provide actionable business insights.

## 🛠 Tools & Technologies
* **Data Cleaning & Analysis:** Microsoft Excel
* **Database Management:** MySQL (SQL Workbench 8.0)
* **Visualization:** Power BI Desktop
* **Version Control:** GitHub

---

## 📂 Project Structure
```text
Superstore-BI-Project/
│
├── Data/
│   ├── Superstore.csv
│   └── Excel_Analysis.xlsx
├── SQL/
│   └── Superstorequeries.sql
├── Visualization/
│   └── Superstoresales.pbix
├── Docs/
│   └── Superstore Business Analysis Report.docx
└── README.md

```

---

## 🔍 Project Workflow

### 1️⃣ Data Cleaning & Preparation (Excel)

Before analysis, raw data was cleaned to ensure accuracy:

* Removed duplicate entries and handled missing values.
* Standardized date formats and category labels.
* Created Pivot Tables for preliminary trend exploration (Monthly Sales, Regional performance).

### 2️⃣ SQL Data Extraction (MySQL)

The cleaned dataset was migrated to MySQL for advanced aggregation and metric validation.

**Key SQL operations included:**

* Calculating total revenue and profit margins.
* Segmenting sales by region and product category.
* Generating trend reports using `LAG()` window functions.

```sql
-- Example: Sales by Region
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

```

### 3️⃣ Power BI Dashboard Development

<img width="1346" height="759" alt="Screenshot 2026-03-13 145806" src="https://github.com/user-attachments/assets/b8e1ad52-afc3-4010-a118-a5248c43625d" />


**Key Features:**

* **KPI Cards:** Tracked Total Sales, Profit, and Order Volume.
* **Visualizations:** Monthly trend line charts, regional bar charts, and category distribution.
* **Filters:** Implemented interactive slicers for Region, Category, and Date ranges.

---

## 📈 Key Business Insights

* **Total Performance:** The company generated significant revenue with a stable 10%–12% profit margin.
* **Regional Disparity:** The West region consistently outperforms, while the South requires targeted operational adjustments.
* **Category Drivers:** Technology and Office Supplies are the primary revenue engines.
* **Seasonality:** Pronounced sales peaks occur in Q4, confirming a strong holiday-driven business cycle.

## 🎯 Strategic Recommendations

1. **Regional Optimization:** Implement localized marketing strategies for underperforming regions.
2. **Category Investment:** Double down on high-performing Technology inventory.
3. **Seasonal Planning:** Scale operations and staffing ahead of the Q4 surge.
4. **Pricing Discipline:** Audit discount bands to protect profit margins in the Furniture category.

---

## 🚀 Skills Demonstrated

* ✔ Data Cleaning & Transformation
* ✔ SQL Querying (Joins, Aggregations, Window Functions)
* ✔ Business Intelligence Reporting
* ✔ Dashboard Design & Data Storytelling

---

```
