# retail-analytics-end-to-end-sql-ml
A complete end-to-end retail analytics project using PostgreSQL, Python, and machine learning. Includes schema design, data cleaning, dimensional modeling, master table creation, exploratory data analysis, price optimization, demand segmentation, and predictive modeling across multi-channel sales datasets.
---

## 🔹 Start Here (Executive Overview)

If you want a quick, high-level understanding of this project, start here:

- 📄 **Executive Story (business insights & decisions)**  
  → [`EXECUTIVE_STORY.md`](./EXECUTIVE_STORY.md)

- 📊 **Power BI Executive Dashboard (PDF)**  
  → [`powerbi/sku_performance_channel_segmentation_dashboard.pdf`](./powerbi/sku_performance_channel_segmentation_dashboard.pdf)

- 📘 **Dashboard Guide:** [`DASHBOARD_OVERVIEW.md`](./DASHBOARD_OVERVIEW.md)

- 📈 **Exploratory Data Analysis (Python)**  
  → `python/01_eda_sku_analytics_mart.ipynb`

- 🤖 **SKU Segmentation (Machine Learning)**  
  → `python/07_ml_sku_segmentation.ipynb`

---

## 🏗 Project Pipeline Overview

Raw CSV files  
→ PostgreSQL staging tables  
→ Fact & dimension tables  
→ SKU analytics mart (1 row per SKU)  
→ Python EDA  
→ SKU-level clustering (ML)  
→ Power BI executive dashboard
