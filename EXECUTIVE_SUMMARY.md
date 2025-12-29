# 📊 SKU Performance & Channel Segmentation  
### Amazon & International Sales Portfolio Analysis

---

## 1. Business Context

The business sells a large and diverse SKU portfolio across multiple sales channels, primarily **Amazon** and **International markets**.  
Decision-makers lack a **unified, SKU-level view** to answer key questions such as:

- Which SKUs truly drive revenue?
- How concentrated is revenue across the portfolio?
- Which channels and SKU segments perform best?
- Where should inventory, pricing, and expansion efforts be focused?

The objective of this project was to build a **decision-ready analytics system** that enables SKU prioritization using data, not intuition.

---

## 2. Data & Architecture Overview

### Data Sources
Seven raw datasets were integrated, including:
- Amazon sales transactions
- International sales transactions
- SKU master and inventory attributes
- Pricing reference tables
- Operational and expense reference data

### Architecture
- **PostgreSQL**  
  - Data cleaning and normalization  
  - Staging, fact, and dimension modeling  
- **Python**  
  - Exploratory Data Analysis (EDA)  
  - SKU-level clustering (segmentation, not prediction)  
- **Power BI**  
  - Executive dashboard for portfolio decision-making  

### Final Analytics Mart
- Grain: **1 row per SKU**
- Records: ~7,400 SKUs
- Key metrics:
  - Amazon revenue & units
  - International revenue & units
  - Total revenue & total units
  - Channel participation flags
  - SKU cluster assignment
  - Global revenue rank (Top 20% vs Bottom 80%)

This ensured **metric consistency** across SQL, Python, and Power BI.

---

## 3. Key Insights (Quantified)

### 1️⃣ Revenue is highly concentrated (Pareto effect)
- ~**20% of SKUs generate ~80% of total revenue**
- The remaining SKUs form a long tail with marginal individual impact

**Implication:** Portfolio performance is driven by a small subset of SKUs. Equal treatment of all SKUs is inefficient.

---

### 2️⃣ Cross-channel SKUs outperform single-channel SKUs
- ~**50% of SKUs sell across both Amazon and International channels**
- Cross-channel SKUs generate **disproportionately higher revenue** than single-channel SKUs

**Implication:** Cross-channel presence is a strong indicator of SKU success.

---

### 3️⃣ SKUs naturally segment into three performance clusters
Using K-Means clustering on SKU-level revenue and unit metrics, three interpretable segments emerged:

| Cluster | Description |
|------|------------|
| Amazon-focused SKUs | Strong Amazon performance, limited international presence |
| International-heavy SKUs | Strong international sales, weak or no Amazon traction |
| High-performing cross-channel SKUs | Strong revenue across both channels |

**Implication:** Different SKU segments require different commercial strategies.

---

### 4️⃣ Revenue concentration varies by product category
Certain categories are overrepresented among:
- High-performing cross-channel SKUs
- Top 20% revenue contributors

**Implication:** Category-level assortment decisions should be informed by SKU performance clusters.

---

## 4. Portfolio Segmentation & Decisions

### SKU Portfolio Tiering
Each SKU is classified using a **global revenue rank**:

- **Top 20% SKUs** → Primary revenue drivers  
- **Bottom 80% SKUs** → Long-tail portfolio  

This classification is:
- Stable
- Reproducible
- Independent of dashboard filters

---

### Recommended Actions by Segment

#### 🟢 High-performing cross-channel SKUs
- Prioritize inventory availability
- Expand assortment using similar product attributes
- Maintain price parity across channels

#### 🟡 Amazon-focused SKUs
- Evaluate feasibility of international expansion
- Optimize Amazon-specific merchandising and fulfillment

#### 🔵 International-heavy SKUs
- Assess Amazon market fit before expansion
- Focus on international supply chain efficiency

#### ⚪ Bottom 80% SKUs
- Review for assortment rationalization
- Identify candidates for clearance or bundling
- Avoid over-investment in low-impact SKUs

---

## 5. Dashboard Walkthrough

The Power BI dashboard was designed as a **single-page executive view**:

- **Top KPIs**: Total revenue, total units, active SKUs, % cross-channel
- **Portfolio Overview**: Revenue concentration and SKU distribution by cluster
- **Channel Analysis**: Amazon vs International revenue by cluster
- **Category × Cluster Matrix**: Highlights where revenue concentrates
- **Action Table**:
  - SKU-level revenue and units
  - Cluster assignment
  - Portfolio tier (Top 20% SKUs clearly highlighted)

The dashboard supports **immediate decision-making**, not just descriptive analysis.

---

## 6. Assumptions & Limitations

- Analysis is **revenue-based**, not true profitability  
  (Marketplace fees, logistics costs, and returns were not available)
- Time-series trends were not analyzed due to data constraints
- Clustering is descriptive and used for segmentation, not prediction

These limitations are explicitly acknowledged to avoid overstating conclusions.

---

## 7. Reproducibility

The project is fully reproducible:

1. Load raw datasets into PostgreSQL
2. Build staging, fact, and dimension tables
3. Generate the SKU analytics mart
4. Perform EDA and clustering in Python
5. Export the final analytics mart
6. Build the Power BI dashboard using a single trusted dataset

All SQL scripts, Python notebooks, and outputs are documented in this repository.

---

## Final Note

This project demonstrates:
- End-to-end analytics ownership
- Strong data modeling and SQL fundamentals
- Business-oriented SKU segmentation
- Clear translation of insights into actions

The focus is on **real-world analytics decision-making**, not just technical experimentation.
