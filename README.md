# superstore-profitability-analysis

---

## ⚙️ End-to-End Workflow

### **1️⃣ Excel (Initial Cleaning)**
- Checked for missing values  
- Fixed text inconsistencies  
- Validated numeric fields (Sales, Quantity, Discount, Profit)  

---

### **2️⃣ MySQL (Core Cleaning & Enhancement)**
Performed strict data cleaning and calculation using SQL:

✔ Fixed date formats using `STR_TO_DATE()`  
✔ Fixed decimal precision using `DECIMAL(18,4)`  
✔ Created analytical columns:
- `unit_price = sales / quantity`
- `margin_pct = profit / sales`
- `order_month`, `order_year`

✔ Exported `superstore_cleaned` table for Power BI

---

### **3️⃣ Power BI (Modeling & DAX)**
- Set proper data types  
- Removed text whitespace (Trim/Clean)  
- Connected date fields for drill-down  
- Created advanced DAX measures:

**Core KPIs**
- Total Sales  
- Total Profit  
- Average Order Value  
- Revenue YoY %  
- Total Orders  

**Profitability Metrics**
- Weighted Margin %  
- Avg Profit Per Order  
- Loss Order %  

---

### **4️⃣ Visualisation (Dashboard Pages)**

## 📸 Dashboard Preview

### **Page 1 — Executive Overview**
- Total Sales  
- Total Profit  
- Avg Order Value  
- Total Orders  
- Revenue YoY %  
- Sales & Profit Trend  
- Sales/Profit by Region  
- Profit by Segment  

![Page 1](images/dashboard_page1.png)

---

### **Page 2 — Deep Profitability Diagnostics**
- Avg Profit Per Order  
- Weighted Margin %  
- Total Customers  
- Loss Order %  
- **Scatter: Profit vs Discount** → identifies 20% “discount danger zone”  
- Sub-Category Profitability Matrix  
- Top 10 Customers by Sales & Profit  
- Loss % by Category  

![Page 2](images/dashboard_page2.png)

---

## 🔍 Key Insights :

### ⭐ **1. Discounts > 20% consistently result in negative profit**
The scatter plot proves a strong negative correlation between discounting and profit.

### ⭐ **2. Product Mix Problem — Furniture bleeds money**
Sub-categories like **Tables** and **Bookcases** produce high revenue but negative profit margins.

### ⭐ **3. Region Risk**
Some regions show high sales but low or negative profitability → possible logistics or pricing issue.

### ⭐ **4. Customer Concentration**
Top 10 customers contribute disproportionately to profit → retention focus recommended.

---

## 💡 Recommendations

### **1️⃣ Cap Discounts Above 20%**
Establish manager approval for discounts > 20%.

### **2️⃣ Reprice / renegotiate high-loss items**
Especially **Tables** and **Bookcases** → primary drivers of profit loss.

### **3️⃣ Focus on High-Value Customers**
Implement priority service or loyalty programs.

### **4️⃣ Investigate Unprofitable Regions**
Review shipping, warehousing, FTL/LTL cost structures.

---

## 📎 Files Included
- Power BI PBIX file  
- SQL cleaning scripts  
- Cleaned dataset  
- DAX measures  
- Final dashboard PDF  
- High-resolution screenshots  

---

## 👤 Author
**Swetank Kumar**  
Aspiring Data Analyst | Power BI | SQL | DAX  
LinkedIn: www.linkedin.com/in/swetank-jha-407a0b372

