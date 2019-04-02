USE bamazon;

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES 
("Patio Swing", "Outdoors", 799.00, 40),
("Portable Grill", "Outdoors", 600.00, 10),
("Samsung TV", "Electronics", 900.00, 80),
("Massage Chair", "Home", 490.00, 15),
("Stainless Steel Pan", "Kitchen", 68.00, 10),
("Storage glass set", "Kitchen", 40.00, 2),
("Recliners", "Furniture", 130.00, 20),
("Dining Table", "Furniture", 1184.00, 40),
("Apple iPad", "Electronics", 855.00, 20),
("Sunglasses", "Fashion", 100.00, 10);

SELECT * FROM products;