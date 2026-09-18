# Supply Chain Performance Analysis

## Project Overview

This project analyzes a simulated consumer electronics supply chain dataset using SQL. The goal of the analysis is to evaluate inventory levels, order activity, warehouse performance, and delivery times to identify operational patterns and areas that may require further investigation.

The dataset contains 20 order records across five products and three warehouses.

Rather than only calculating summary statistics, this project also uses exploratory analysis to investigate patterns discovered during the initial analysis.

---

## Business Problem

The company is experiencing concerns related to stockouts, excess inventory, and delayed deliveries.

Management needs a better understanding of:

- Inventory distribution across products
- Order volume across warehouses
- Product demand and order activity
- Delivery performance
- Potential overstock situations
- Whether order size may be associated with delivery time

The purpose of this analysis is to use available supply chain data to identify patterns that could support future operational decisions.

---

## Dataset

The simulated dataset contains the following fields:

| Column | Description |
|---|---|
| `order_id` | Unique identifier for each order |
| `product_name` | Product associated with the order |
| `warehouse_id` | Warehouse processing the order |
| `inventory_level` | Recorded inventory level |
| `order_quantity` | Number of units included in the order |
| `delivery_time_days` | Number of days required for delivery |

The dataset contains:

- 20 order records
- 5 products
- 3 warehouses

The sample database can be found in:

`data/supply_chain_data.sql`

---

## Tools & Technologies

- SQL
- DB Fiddle
- Git
- GitHub

---

## SQL Skills Demonstrated

This project demonstrates the use of:

- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `COUNT()`
- `ROUND()`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `CASE WHEN`
- Aliases
- Conditional filtering
- Multi-column grouping
- Aggregate analysis

The complete SQL analysis is available in:

`queries/supply_chain_analysis.sql`

---

# Analysis

## Initial Analysis

The initial analysis answered 10 supply chain questions involving inventory, orders, warehouses, and delivery performance.

### Inventory

Product A had the highest total inventory at **3,605 units**, while Product B had the lowest at **2,320 units**.

Products A, C, and D each had more than 3,300 total inventory units, while Products B and E remained below 2,500.

### Warehouse Order Activity

WH3 had the highest average order quantity at **251.67 units**, closely followed by WH1 at **249.29 units**.

However, WH1 processed the highest total order volume at **1,745 units**.

This demonstrates the difference between average order size and total warehouse volume.

### Delivery Performance

Individual delivery times ranged from **2 to 10 days**.

Average delivery times by warehouse were:

| Warehouse | Average Delivery Time |
|---|---:|
| WH1 | 5.43 days |
| WH2 | 5.43 days |
| WH3 | 5.17 days |

Although WH3's average was only 0.26 days shorter than WH1 and WH2, this represents approximately **6.2 hours**.

This highlighted the importance of maintaining appropriate decimal precision because excessive rounding can hide potentially meaningful differences.

### Order Size

**12 of 20 orders (60%)** exceeded 200 units.

### Potential Overstock

**7 of 20 inventory records (35%)** exceeded the project's 900-unit overstock threshold.

The threshold is used for this analysis and does not independently establish that inventory above 900 units is excessive.

---

# Exploratory Analysis

After completing the initial analysis, additional questions were developed based on patterns observed in the data.

## 1. Which Products Account for the Most Overstock Occurrences?

Products C and E each had **two inventory records above 900 units**, the highest among the five products.

| Product | Overstock Occurrences |
|---|---:|
| Product C | 2 |
| Product E | 2 |
| Product A | 1 |
| Product B | 1 |
| Product D | 1 |

Product E was notable because it had the fewest orders in the dataset while still tying for the highest number of inventory records above the threshold.

However, this alone does not establish that Product E is improperly stocked.

Product lifecycle, seasonality, expected demand, customer purchasing behavior, and inventory strategy could all influence appropriate inventory levels.

---

## 2. Which Warehouse Processes the Highest Total Order Volume?

| Warehouse | Total Units Ordered |
|---|---:|
| WH1 | 1,745 |
| WH3 | 1,510 |
| WH2 | 1,410 |

WH1 processed the highest total unit volume.

Although WH3 had a slightly larger average order quantity, WH1 handled more orders, resulting in a higher total volume.

This demonstrates why both average order size and total order activity should be considered when evaluating warehouse workload.

---

## 3. Are Larger Orders Associated With Longer Delivery Times?

Orders were divided into two categories using a SQL `CASE WHEN` statement:

- **Large Order:** More than 200 units
- **Small Order:** 200 units or fewer

The results showed:

| Order Size | Average Delivery Time |
|---|---:|
| Large Order | 6.83 days |
| Small Order | 3.13 days |

Large orders took approximately **3.70 additional days** to deliver on average within this sample.

This relationship does not establish that larger orders cause longer delivery times. Other variables such as product availability, warehouse capacity, shipping distance, and fulfillment methods could influence delivery performance.

---

## 4. Does the Order-Size Pattern Persist Across Warehouses?

To determine whether one warehouse was driving the difference, delivery performance was segmented by both warehouse and order size.

| Warehouse | Order Size | Average Delivery Time |
|---|---|---:|
| WH1 | Large Order | 7.00 days |
| WH1 | Small Order | 3.33 days |
| WH2 | Large Order | 6.60 days |
| WH2 | Small Order | 2.50 days |
| WH3 | Large Order | 7.00 days |
| WH3 | Small Order | 3.33 days |

The pattern persisted across all three warehouses.

Large orders took approximately **3.67 to 4.10 additional days** to deliver depending on the warehouse.

This suggests that the overall relationship between order size and delivery time was not isolated to a single warehouse in the sample.

It also demonstrates how overall averages can conceal meaningful differences between subgroups.

---

## 5. How Does Inventory Compare With Order Activity?

A product-level summary was created to compare inventory with order activity.

| Product | Total Inventory | Number of Orders | Units Ordered | Avg. Order Quantity |
|---|---:|---:|---:|---:|
| Product A | 3,605 | 5 | 1,375 | 275.00 |
| Product B | 2,320 | 4 | 1,025 | 256.25 |
| Product C | 3,365 | 4 | 640 | 160.00 |
| Product D | 3,350 | 4 | 955 | 238.75 |
| Product E | 2,370 | 3 | 670 | 223.33 |

Product C stood out in this comparison.

Product C maintained **3,365 inventory units**, compared with Product B's **2,320 units**. Although both products had four orders, Product B accounted for **1,025 units ordered**, while Product C accounted for only **640 units**.

This suggests that Product C carries relatively high inventory compared with its observed order activity.

Additional demand and inventory-planning data would be needed before determining whether Product C is actually overstocked.

---

# Key Findings

The analysis identified several notable patterns:

1. **Product A had the highest inventory and highest order count.**

2. **WH1 processed the highest total order volume**, despite WH3 having the highest average order quantity.

3. **60% of orders exceeded 200 units.**

4. **Large orders averaged 6.83 days for delivery compared with 3.13 days for smaller orders**, a difference of 3.70 days.

5. **The longer delivery times associated with larger orders appeared across all three warehouses**, rather than being isolated to one location.

6. **Products C and E had the most inventory records above the project's 900-unit threshold.**

7. **Product C carried relatively high inventory compared with its observed order activity**, making it a candidate for further investigation.

---

# Business Recommendations

Based on the patterns identified in this sample, management could consider:

### Investigate Large-Order Fulfillment

Large orders were associated with substantially longer delivery times across all three warehouses.

The fulfillment process for orders exceeding 200 units should be investigated to determine whether capacity constraints, inventory availability, picking and packing requirements, or shipping methods contribute to longer delivery times.

### Review Product C Inventory Strategy

Product C had relatively high inventory compared with its observed order activity and tied for the highest number of inventory records above 900 units.

Before reducing inventory, the company should review Product C's demand forecast, seasonality, safety-stock requirements, supplier lead times, and product lifecycle.

### Evaluate Warehouse Capacity

WH1 processed the highest total unit volume, while large orders experienced longer delivery times across all warehouses.

Warehouse capacity and throughput data should be incorporated into future analysis to determine whether current facilities can efficiently support order volume.

### Improve Delivery Performance Measurement

Future analysis should incorporate promised and actual delivery timestamps rather than relying only on delivery days.

More detailed timing data could identify operationally significant delays that may be hidden when delivery performance is rounded to whole days.

---

# Data Limitations

This project uses a **small simulated dataset of 20 records**. The findings demonstrate analytical methods and patterns within the sample and should not be generalized to a real supply chain without additional data.

The dataset does not include several variables that could explain the observed patterns, including:

- Historical product demand
- Sales revenue
- Product price
- Product category
- Warehouse capacity
- Warehouse location
- Customer location or ZIP code
- Customer type
- Shipping distance
- Shipping method
- Supplier lead times
- Safety-stock requirements
- Reorder points
- Product lifecycle
- Seasonality
- Promised delivery timestamps
- Actual delivery timestamps

These limitations prevent the analysis from establishing the causes of the observed inventory and delivery patterns.

**Data Modeling Limitation:** The simulated dataset records `inventory_level` within each order record. In a real-world supply chain database, inventory levels would typically be tracked separately or captured as timestamped inventory snapshots. Therefore, summing inventory levels in this project is used to satisfy the scope of the analysis but may not represent how current inventory would be calculated in a production environment.
---

# Future Analysis

Future versions of this project could incorporate additional data to investigate:

- Warehouse capacity utilization
- Product demand versus available supply
- Revenue by product and warehouse
- Geographic differences in delivery performance
- Customer purchasing patterns
- Seasonal inventory requirements
- Supplier lead times
- Inventory turnover
- Stockout frequency
- Order fulfillment performance

A larger historical dataset would also allow for more robust statistical analysis of relationships between order size, inventory levels, warehouse activity, and delivery performance.

---

# Project Structure

```text
supply-chain-performance-analysis/
│
├── README.md
│
├── data/
│   └── supply_chain_data.sql
│
├── queries/
│   └── supply_chain_analysis.sql
│
└── results/
    └── analysis_findings.md
```

---

## Detailed Findings

A more detailed explanation of the initial SQL results and analytical observations is available in:

`results/analysis_findings.md`
