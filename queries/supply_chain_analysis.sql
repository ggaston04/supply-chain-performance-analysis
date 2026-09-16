-- =====================================================
-- Supply Chain Performance Analysis
-- SQL Analysis
-- =====================================================


-- =====================================================
-- Q1: Calculate Total Inventory Levels
-- Calculate the total inventory level for each product.
-- =====================================================

SELECT 
    product_name,
    SUM(inventory_level) AS total_inventory
FROM supply_chain
GROUP BY product_name;


-- =====================================================
-- Q2: Calculate Average Order Quantity
-- Find the average order quantity for each warehouse.
-- =====================================================

SELECT
    warehouse_id,
    ROUND(AVG(order_quantity), 2) AS average_order_quantity
FROM supply_chain
GROUP BY warehouse_id;


-- =====================================================
-- Q3: Find Minimum and Maximum Delivery Times
-- Determine the shortest and longest delivery times
-- across all orders.
-- =====================================================

SELECT
    MIN(delivery_time_days) AS min_delivery_time_days,
    MAX(delivery_time_days) AS max_delivery_time_days
FROM supply_chain;


-- =====================================================
-- Q4: Count the Number of Orders
-- Count the number of orders placed for each product.
-- =====================================================

SELECT
    product_name,
    COUNT(order_id) AS total_orders
FROM supply_chain
GROUP BY product_name;


-- =====================================================
-- Q5: Count Non-Empty Inventory Records
-- Count the number of non-NULL values in the
-- inventory_level column.
-- =====================================================

SELECT
    COUNT(inventory_level) AS non_empty_inventory_count
FROM supply_chain;


-- =====================================================
-- Q6: Sum Order Quantities for Warehouse WH1
-- Calculate the total order quantity processed
-- by Warehouse WH1.
-- =====================================================

SELECT
    SUM(order_quantity) AS total_order_quantity_WH1
FROM supply_chain
WHERE warehouse_id = 'WH1';


-- =====================================================
-- Q7: Count Orders Greater Than 200 Units
-- Count the number of orders with an order quantity
-- greater than 200 units.
-- =====================================================

SELECT
    COUNT(order_id) AS orders_over_200_units
FROM supply_chain
WHERE order_quantity > 200;


-- =====================================================
-- Q8: Calculate Total Inventory for Product A
-- Calculate the total inventory level for Product A.
-- =====================================================

SELECT
    SUM(inventory_level) AS total_inventory_productA
FROM supply_chain
WHERE product_name = 'Product A';


-- =====================================================
-- Q9: Analyze Delivery Times by Warehouse
-- Calculate the average delivery time for each warehouse.
-- Results are rounded to two decimal places to preserve
-- potentially meaningful differences between warehouses.
-- =====================================================

SELECT
    warehouse_id,
    ROUND(AVG(delivery_time_days), 2) AS avg_delivery_time
FROM supply_chain
GROUP BY warehouse_id;


-- =====================================================
-- Q10: Identify Overstock Situations
-- Count the number of inventory records where the
-- inventory level exceeds 900 units.
-- =====================================================

SELECT
    COUNT(inventory_level) AS overstock_count
FROM supply_chain
WHERE inventory_level > 900;
-- =====================================================
-- EXPLORATORY ANALYSIS
-- Additional questions developed from the initial findings
-- =====================================================


-- =====================================================
-- E1: Which products account for the most overstock
-- occurrences?
-- =====================================================

SELECT 
    product_name,
    COUNT(inventory_level) AS overstock_occurrences
FROM supply_chain
WHERE inventory_level > 900
GROUP BY product_name
ORDER BY overstock_occurrences DESC;


-- =====================================================
-- E2: Which warehouse processes the highest total
-- order volume?
-- =====================================================

SELECT 
    warehouse_id,
    SUM(order_quantity) AS total_order_quantity
FROM supply_chain
GROUP BY warehouse_id
ORDER BY total_order_quantity DESC;


-- =====================================================
-- E3: Do larger orders take longer to deliver than
-- smaller orders?
--
-- Large Order: > 200 units
-- Small Order: <= 200 units
-- =====================================================

SELECT
    CASE
        WHEN order_quantity > 200 THEN 'Large Order'
        ELSE 'Small Order'
    END AS order_size,
    ROUND(AVG(delivery_time_days), 2) AS avg_delivery_time
FROM supply_chain
GROUP BY order_size;


-- =====================================================
-- E4: How does average delivery time for large and
-- small orders differ by warehouse?
-- =====================================================

SELECT
    warehouse_id,
    CASE
        WHEN order_quantity > 200 THEN 'Large Order'
        ELSE 'Small Order'
    END AS order_size,
    ROUND(AVG(delivery_time_days), 2) AS avg_delivery_time
FROM supply_chain
GROUP BY warehouse_id, order_size
ORDER BY warehouse_id, order_size;


-- =====================================================
-- E5: How does inventory compare with order activity
-- for each product?
-- =====================================================

SELECT
    product_name AS product,
    SUM(inventory_level) AS total_inventory,
    COUNT(order_id) AS number_of_orders,
    SUM(order_quantity) AS total_units_ordered,
    ROUND(AVG(order_quantity), 2) AS avg_order_quantity
FROM supply_chain
GROUP BY product_name;
