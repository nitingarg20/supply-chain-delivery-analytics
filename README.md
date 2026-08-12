# Supply Chain Delivery Analytics

End-to-end analysis of 180K+ orders from a global supply chain dataset — data 
cleaning, SQL analysis, a delivery-risk prediction model, and an interactive dashboard.

## Problem
Identify why orders are late, which regions/shipping modes are most affected, and 
where the business should prioritize fixing delivery performance.

## Approach
- **Data cleaning (Python/pandas):** handled nulls, duplicates, and date parsing on 
  a 180K-row, 53-column dataset
- **SQL (SQLite):** wrote aggregation, window function (RANK), and CTE queries to 
  find on-time delivery rate by region and top revenue categories per region
- **EDA:** tested discount rate vs. late delivery (no correlation) and shipping 
  mode vs. late delivery (strong relationship — First Class is paradoxically the 
  least reliable at ~95% late, vs. Standard Class at ~38%)
- **Classification model (scikit-learn):** decision tree predicting late delivery 
  risk — 69.7% accuracy, 84.4% precision, 54.6% recall. Shipping Mode and scheduled 
  shipping window account for ~99% of feature importance.
- **Dashboard (Tableau Public):** [live link] — 4 linked views covering delivery 
  performance by region, shipping mode, sales trend, and top categories

## Key findings
1. Every region has an on-time delivery rate below 50% — this is a systemic issue, 
   not a regional one
2. Western Europe combines the highest sales volume ($5.9M) with below-average 
   on-time performance — highest-priority region to fix
3. First Class shipping has the worst late-delivery rate (95%), likely because it 
   promises only a 1-day window vs. Standard Class's 4-day window
4. The model favors precision over recall, meaning it under-flags risk — a 
   production version would need retuning to catch more true late orders

## Data note
Order volume drops sharply after September 2017 (from ~5,200/month to ~2,100/month), 
indicating incomplete data collection near the dataset's end — excluded from trend 
analysis.

## Tools
Python (pandas, scikit-learn), SQL (SQLite), Tableau Public

## Live dashboard
https://public.tableau.com/app/profile/nitin.garg5786/viz/SupplyChainDeliveryAnalytics/SupplyChainDeliveryPerformanceDashboard_?publish=yes
