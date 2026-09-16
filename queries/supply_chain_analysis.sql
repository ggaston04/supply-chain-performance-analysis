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
