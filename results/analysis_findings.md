# Supply Chain Performance Analysis — Findings

## Overview

This analysis evaluates a simulated consumer electronics supply chain dataset containing 20 order records across five products and three warehouses.

The analysis focuses on inventory levels, order quantities, warehouse activity, delivery performance, and potential overstock situations.

The purpose of this analysis is not only to calculate supply chain metrics but also to identify patterns, limitations, and areas that may require further investigation.


---

## Q1: Total Inventory Levels by Product

### Results

| Product | Total Inventory |
|---------|----------------:|
| Product A | 3,605 |
| Product B | 2,320 |
| Product C | 3,365 |
| Product D | 3,350 |
| Product E | 2,370 |

### Finding

Product A had the highest total inventory at 3,605 units, while Product B had the lowest at 2,320 units.

Products A, C, and D each had total inventory above 3,300 units, while Products B and E remained below 2,500 units.

This shows a noticeable difference in inventory levels across the product portfolio.

### Further Investigation

Inventory totals alone cannot determine whether a product is overstocked or understocked.

Additional information about product demand, sales volume, reorder levels, safety stock requirements, and supplier lead times would be needed to determine whether these inventory differences are appropriate.


---

## Q2: Average Order Quantity by Warehouse

### Results

| Warehouse | Average Order Quantity |
|-----------|-----------------------:|
| WH1 | 249.29 |
| WH2 | 201.43 |
| WH3 | 251.67 |

### Finding

WH3 had the highest average order quantity at 251.67 units, closely followed by WH1 at 249.29 units.

WH2 had the lowest average order quantity at 201.43 units.

This indicates that typical orders processed through WH2 were smaller than those processed through WH1 and WH3.

### Further Investigation

Additional warehouse information would be useful for determining whether differences in average order size are related to warehouse capacity, product allocation, customer demand, or geographic service areas.


---

## Q3: Minimum and Maximum Delivery Times

### Results

| Minimum Delivery Time | Maximum Delivery Time |
|----------------------:|----------------------:|
| 2 days | 10 days |

### Finding

Delivery times ranged from 2 to 10 days, representing an 8-day difference between the fastest and slowest deliveries.

This variation suggests that some orders experience substantially longer delivery times than others.

### Further Investigation

Geographic differences could potentially contribute to the variation in delivery times.

Additional data such as warehouse location, customer ZIP code, shipping distance, shipping method, and carrier information would be needed to investigate whether geography contributes to longer delivery times.

Because this information is not included in the current dataset, the cause of the delivery-time variation cannot be determined from this analysis alone.


---

## Q4: Number of Orders by Product

### Results

| Product | Total Orders |
|---------|-------------:|
| Product A | 5 |
| Product B | 4 |
| Product C | 4 |
| Product D | 4 |
| Product E | 3 |

### Finding

Product A had the highest number of orders with 5 and also had the highest total inventory level.

Product E had the fewest orders with 3. However, Product E's total inventory of 2,370 units was slightly higher than Product B's 2,320 units, despite Product B having more orders.

This difference raises questions about how inventory levels relate to order activity across different products.

### Further Investigation

Several factors could influence the relationship between inventory and order activity, including:

- Customer demand
- Product type
- Purchase frequency
- Expected product life or duration of use
- Supplier lead times
- Safety stock requirements
- Replenishment schedules

For example, a product typically purchased infrequently may require a different inventory strategy than a product purchased repeatedly or in larger quantities.

Additional product and demand data would be needed to determine why these inventory-to-order relationships differ.


---

## Q5: Non-Empty Inventory Records

### Results

| Non-Empty Inventory Records |
|----------------------------:|
| 20 |

### Finding

All 20 records contained a value in the `inventory_level` column.

No NULL inventory values were identified, meaning the full dataset could be used for inventory-level calculations without excluding records because of missing inventory information.

### Data Quality Note

Completeness does not necessarily guarantee accuracy.

Although all inventory records contain values, additional data-quality checks would be necessary to identify potentially incorrect, duplicated, or unrealistic values.


---

## Q6: Total Order Quantity for Warehouse WH1

### Results

| Warehouse | Total Order Quantity |
|-----------|---------------------:|
| WH1 | 1,745 |

### Finding

Warehouse WH1 processed a total order quantity of 1,745 units across the dataset.

This provides a measure of WH1's total order volume but does not show whether its volume is high or low relative to the other warehouses.

### Further Investigation

Total order quantities for WH2 and WH3 should also be calculated to compare warehouse workloads.

Warehouse capacity data could then be incorporated to determine whether each warehouse has sufficient capacity to support its order volume.


---

## Q7: Orders Greater Than 200 Units

### Results

| Orders Greater Than 200 Units |
|------------------------------:|
| 12 |

### Finding

12 of the 20 orders contained more than 200 units.

This represents:

**12 / 20 = 60%**

Therefore, 60% of the orders in the dataset exceeded the project's 200-unit threshold.

### Further Investigation

The high percentage of orders above the threshold raises several operational questions:

- Do the warehouses have sufficient capacity to consistently process larger orders?
- What is the relationship between product demand and available inventory?
- Do larger orders take longer to deliver?
- Can larger orders still reach customers within expected delivery timeframes?
- Does warehouse capacity influence delivery performance?

Additional warehouse capacity and historical demand data would be needed to answer some of these questions.

However, the existing dataset contains both `order_quantity` and `delivery_time_days`, meaning the relationship between order size and delivery time can be explored further using SQL.


---

## Q8: Total Inventory for Product A

### Results

| Product | Total Inventory |
|---------|----------------:|
| Product A | 3,605 |

### Finding

Product A had a total inventory level of 3,605 units.

This confirms the Product A inventory total identified in the broader product-level analysis from Q1.

This query demonstrates how a specific product can be isolated for targeted inventory analysis.


---

## Q9: Average Delivery Time by Warehouse

### Results

| Warehouse | Average Delivery Time |
|-----------|----------------------:|
| WH1 | 5.43 days |
| WH2 | 5.43 days |
| WH3 | 5.17 days |

### Finding

WH3 had the shortest average delivery time at 5.17 days.

WH1 and WH2 both had average delivery times of 5.43 days.

The difference between WH3 and WH1/WH2 is approximately:

**5.43 - 5.17 = 0.26 days**

This represents approximately **6.2 hours**.

Although 0.26 days appears small when expressed in days, several hours could be operationally meaningful depending on the customer or business context.

For example, delivery timing could affect customers expecting a package within a particular window or businesses requiring equipment to arrive and be installed before opening or outside peak operating hours.

### Analytical Note: Rounding

Initially rounding delivery times to whole days would make all three warehouses appear to have approximately the same delivery performance.

Maintaining two decimal places revealed a difference that would otherwise be hidden.

This demonstrates that excessive rounding can remove potentially meaningful information from an analysis.

### Further Investigation

Additional data would be needed to determine whether the observed delivery-time differences have a meaningful operational impact.

Useful fields could include:

- Promised delivery date and time
- Actual delivery timestamp
- Customer type
- Business operating hours
- Warehouse location
- Customer ZIP code
- Shipping distance
- Shipping method

These variables could help determine whether delivery performance is meeting customer and operational requirements.


---

## Q10: Overstock Situations

### Results

| Overstock Situations |
|---------------------:|
| 7 |

### Finding

7 of the 20 inventory records exceeded the project's overstock threshold of 900 units.

This represents:

**7 / 20 = 35%**

Therefore, 35% of inventory records met the project's definition of an overstock situation.

### Further Investigation

The 900-unit threshold is defined by this analysis and should not automatically be interpreted as proof that inventory above 900 units is excessive.

Additional analysis should determine:

- Which products account for the most overstock occurrences
- Which warehouses contain the most overstock occurrences
- Whether high inventory corresponds with high product demand
- Whether inventory levels exceed established safety-stock or reorder targets
- Whether excess inventory increases holding costs

Demand forecasts, inventory targets, and product-level inventory policies would be required to determine whether these records represent true excess inventory.


---

# Key Findings

The initial supply chain analysis identified several notable patterns:

1. Product A maintained the highest total inventory and also had the highest number of orders.

2. Products A, C, and D each had more than 3,300 total inventory units, while Products B and E remained below 2,500 units.

3. WH3 processed the highest average order quantity at 251.67 units, while WH2 processed the lowest at 201.43 units.

4. Delivery times varied substantially across individual orders, ranging from 2 to 10 days.

5. 60% of orders exceeded 200 units, raising questions about warehouse capacity and the relationship between order size and delivery performance.

6. Average delivery times were relatively close across warehouses, but preserving decimal precision revealed a difference of approximately 6.2 hours between WH3 and WH1/WH2.

7. 35% of inventory records exceeded the project's 900-unit overstock threshold.

8. The inventory_level field contained no NULL values across the 20 records analyzed.


---

# Data Limitations

This project uses a small simulated dataset containing 20 records.

The analysis can identify patterns within the sample, but the results should not be generalized to a real supply chain without additional data.

Several variables that could improve the analysis are not currently available, including:

- Historical sales and demand
- Warehouse capacity
- Warehouse geographic location
- Customer delivery location
- Shipping distance
- Shipping method
- Supplier lead times
- Reorder points
- Safety stock targets
- Product category
- Customer type
- Promised delivery windows
- Actual delivery timestamps

Because these variables are unavailable, the analysis identifies areas for further investigation rather than assuming causes for the observed patterns.


---

# Next Steps

The exploratory phase identified additional patterns related to inventory, order volume, and delivery performance. Future analysis could expand the dataset and incorporate additional variables to better understand the factors contributing to these patterns.

Potential areas for future analysis include:

- Analyzing historical product demand and sales trends
- Comparing inventory levels with reorder points and safety-stock requirements
- Evaluating warehouse capacity and utilization
- Analyzing delivery performance by customer location and shipping distance
- Comparing promised delivery times with actual delivery times
- Evaluating product revenue and profitability
- Investigating seasonal changes in product demand
- Analyzing supplier lead times and their impact on inventory levels

A larger historical dataset would also allow for more robust analysis of the relationships between inventory, order size, warehouse activity, and delivery performance.
