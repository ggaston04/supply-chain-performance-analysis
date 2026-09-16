CREATE TABLE supply_chain (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    warehouse_id VARCHAR(10),
    inventory_level INT,
    order_quantity INT,
    delivery_time_days INT
);

INSERT INTO supply_chain
(order_id, product_name, warehouse_id, inventory_level, order_quantity, delivery_time_days)
VALUES
(1001, 'Product A', 'WH1', 850, 150, 3),
(1002, 'Product B', 'WH2', 420, 275, 6),
(1003, 'Product C', 'WH3', 975, 125, 4),
(1004, 'Product A', 'WH1', 760, 320, 5),
(1005, 'Product D', 'WH2', 1100, 210, 8),
(1006, 'Product B', 'WH3', 300, 180, 2),
(1007, 'Product E', 'WH1', 940, 250, 7),
(1008, 'Product C', 'WH2', 680, 90, 3),
(1009, 'Product A', 'WH3', 520, 400, 9),
(1010, 'Product D', 'WH1', 890, 175, 4),
(1011, 'Product E', 'WH2', 1050, 225, 6),
(1012, 'Product B', 'WH3', 610, 310, 5),
(1013, 'Product C', 'WH1', 1150, 280, 10),
(1014, 'Product A', 'WH2', 450, 130, 2),
(1015, 'Product D', 'WH3', 720, 350, 7),
(1016, 'Product E', 'WH1', 380, 195, 3),
(1017, 'Product B', 'WH2', 990, 260, 8),
(1018, 'Product C', 'WH3', 560, 145, 4),
(1019, 'Product A', 'WH1', 1025, 375, 6),
(1020, 'Product D', 'WH2', 640, 220, 5);
