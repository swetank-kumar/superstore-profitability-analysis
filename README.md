# Superstore Sales & Profitability Dashboard 📊

## 🚀 Project Overview
The Superstore is experiencing strong revenue growth but inconsistent profitability.  
This project analyzes **where profit is generated, where it is lost, and why**, focusing on discounting behavior, product mix, customer segments, and regional performance.

The dashboard is designed for **business decision-makers**, providing both an executive overview and a detailed diagnostic view.

---

## 🛠 Tech Stack & Architecture

**Database**
- MySQL (ETL, feature engineering, data type enforcement)

**Data Modeling**
- Star Schema (Fact Table + Date Dimension)

**Visualization**
- Power BI

**Languages**
- DAX (Measures & KPIs)
- SQL (DDL/DML)

**Architecture**
- Decoupled Pipeline: **SQL Backend → Staged CSV → Power BI**

---

## ⚙️ The Data Pipeline (End-to-End Workflow)

This project simulates a real-world Business Intelligence workflow, moving from raw data to actionable insights.

### 1️⃣ Data Staging & Ingestion (MySQL)
- Raw sales data imported into a staging table (`raw_superstore_data`)
- Initial inconsistencies handled (text-based dates, numeric values stored as strings)
- Strict schema designed for the final table to enforce correct data types

### 2️⃣ Feature Engineering (SQL)
ETL logic applied to create analytics-ready data:
- **Profit Status:** Flagged orders as Profit or Loss
- **Unit Price & Margin %:** Calculated at row level for accuracy
- **Date Standardization:** Unified formats into SQL `DATE` type

### 3️⃣ Visualization Layer (Power BI)
- Power BI connected only to the cleaned dataset
- Star Schema implemented with a dedicated Date dimension
- Reusable DAX measures created for:
  - Revenue YoY %
  - Weighted Margin %
  - Loss Order %
  - Average Profit per Order

---

## 📊 Dashboard Structure

### Page 1: Executive Overview
**Purpose:** High-level performance monitoring for leadership

**Key Visuals**
- KPI Cards: Total Sales, Total Profit,Total Order, Avg Order Value, Revenue YoY %
- Sales & Profit Trend 
- Sales vs Profit by Region
- Profit Contribution by Customer Segment

**Key Business Questions**
- Are we growing year-over-year?
- Are we profitable despite revenue growth?
- Which regions and customer segments drive profit?

---

### Page 2: Profitability Diagnostics
**Purpose:** Root cause analysis

**Key Visuals**
- Discount vs Profit Scatter Plot (Pricing Strategy)
- Sub-Category Profitability Matrix (Product Risk)
- Top 10 Customers by Profit
- Loss Order % by Category

**Key Business Questions**
- At what discount level do we start losing money?
- Which specific products are destroying margins?
- How much  risk exists in current sales strategies?

---

## 🔍 Key Insights & Outcomes
- **The 20% Rule:** Discounts above ~20% consistently result in negative margins
- **Product Mix Issues:** Tables and Bookcases are primary loss drivers
- **Operational Risk:** ~19% of orders are loss-making

---

## 💡 Business Recommendations
1. Introduce approval controls for discounts above 15–20%
2. Reprice loss-making sub-categories
3. Track Loss Order % as a primary risk KPI
4. Focus retention and pricing on high-profit segments

---

## 📸 Dashboard Screenshots
- **Executive Overview:** KPIs, regional performance, and trends
- **Profitability Details:** Discount impact and product risk analysis

---
