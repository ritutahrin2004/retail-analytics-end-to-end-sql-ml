# SKU Segmentation using Sales Analytics Mart

## Overview
This document describes the SKU-level segmentation performed using aggregated sales data from a PostgreSQL-based analytics mart. The objective of this analysis is to identify distinct groups of SKUs based on their sales behavior across Amazon and International channels, and translate those patterns into actionable business insights.

The analysis focuses on **unsupervised learning** and emphasizes interpretability and business relevance over model complexity.

---

## Dataset
The segmentation is based on the following table generated in PostgreSQL:


Each row represents a single SKU and includes:
- product attributes (category, size, color, design)
- aggregated Amazon sales metrics
- aggregated International sales metrics

Only SKUs with sales activity in at least one channel are included in the modeling dataset.

---

## Modeling Objective
The goal of this analysis is to:
- segment SKUs with similar sales behavior
- identify channel-dependent and cross-channel product groups
- support inventory planning, channel strategy, and SKU prioritization

This analysis is **descriptive**, not predictive.

---

## Modeling Approach
- KMeans clustering was used to perform SKU segmentation.
- Input features consist of aggregated sales metrics from Amazon and International channels.
- Highly skewed metrics (units sold and revenue) were log-transformed to reduce the influence of extreme values.
- All features were standardized prior to clustering to ensure equal contribution to distance calculations.

EDA and machine learning are intentionally separated into different notebooks to maintain analytical clarity.

---

## Feature Set
The following features were used for clustering:
- Amazon units sold (log-transformed)
- Amazon revenue (log-transformed)
- International units sold (log-transformed)
- International revenue (log-transformed)
- Average Amazon selling price
- Average International selling price

Only numeric, behavior-based features were included.

---

## Choosing the Number of Clusters
The elbow method was used to evaluate clustering inertia for values of K ranging from 2 to 8.  
A clear reduction in inertia was observed up to **K = 3**, after which marginal gains diminished.

Based on this trade-off between simplicity and explanatory power, **K = 3** was selected as the final number of clusters.

---

## Cluster Results and Interpretation

### Cluster 0 — Amazon-Only Moderate Performers
- Represents approximately 39% of SKUs
- Moderate Amazon sales and revenue
- No recorded international sales

These SKUs are primarily Amazon-dependent and may benefit from channel-specific optimization such as listing improvements, promotions, or targeted advertising.

---

### Cluster 1 — International-Heavy SKUs with Minimal Amazon Presence
- Represents approximately 11% of SKUs
- Very high international sales volume
- Negligible Amazon activity

This segment highlights products with strong international demand but limited Amazon penetration. These SKUs present strategic decisions: either expand Amazon presence or intentionally maintain international-only focus.

---

### Cluster 2 — High-Performing Cross-Channel SKUs
- Represents approximately 50% of SKUs
- Strong sales and revenue across both channels
- Highest average pricing and overall contribution

These SKUs are the core revenue drivers and should be prioritized for inventory availability, marketing investment, and supply-chain reliability.

---

## Business Implications
The segmentation reveals that SKU performance is strongly influenced by channel behavior. Key implications include:
- Channel dependency is a major differentiator in SKU performance
- Cross-channel SKUs consistently outperform single-channel SKUs
- International-heavy SKUs represent either untapped Amazon opportunities or intentional channel specialization
- Segmentation provides a practical framework for SKU prioritization and resource allocation

---

## Limitations and Future Work
- The analysis is based on aggregated, non-temporal data
- Time-series demand forecasting is not supported at the current data grain
- Future extensions could incorporate time-based features, promotional data, or price elasticity analysis

---

## Project Status
- Data warehouse rebuilt and validated
- SKU analytics mart recreated reproducibly
- Exploratory data analysis completed
- SKU-level segmentation completed and interpreted
- Ready for downstream business use or further modeling
