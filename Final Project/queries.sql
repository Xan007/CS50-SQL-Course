-- -------------------------------------------
-- Select Queries
-- -------------------------------------------

-- Find all invoices for a customer by first and last name
SELECT *
FROM "invoices"
WHERE "customer_id" IN (
    SELECT "customer_id"
    FROM "customers"
    WHERE "first_name" = 'Sander'
    AND "last_name" = 'Sierra'
);

-- Find all products in a specific category
SELECT *
FROM "products"
WHERE "category_id" = (
    SELECT "category_id"
    FROM "categories"
    WHERE "name" = 'Electronics'
);

-- Find all invoices for a specific customer by customer_id
SELECT *
FROM "invoices"
WHERE "customer_id" = 1;

-- Find all products from a specific supplier
SELECT *
FROM "products"
WHERE "supplier_id" = 2;

-- Find the total price for an invoice (price * quantity)
SELECT "invoice_id", "total"
FROM "invoice_totals" -- this is a view
WHERE "invoice_id" = 1;


-- Find the total number of products sold by category
SELECT "name", "total_products_sold"
FROM "category_sales"; -- this is a view


-- -------------------------------------------
-- Insert Queries
-- -------------------------------------------

-- Add new customers
INSERT INTO "customers" ("first_name", "last_name", "phone_number", "address")
VALUES ('Laura', 'Gomez', '555-2345', 'Calle del Sol 456');
INSERT INTO "customers" ("first_name", "last_name", "phone_number", "address")
VALUES ('Sander', 'Sierra', '555-2345', 'Calle del Sol 456');
INSERT INTO "customers" ("first_name", "last_name", "phone_number", "address")
VALUES ('Carlos', 'Martinez', '555-3456', 'Calle Luna 789');
INSERT INTO "customers" ("first_name", "last_name", "phone_number", "address")
VALUES ('Ana', 'Lopez', '555-4567', 'Avenida Libertad 101');
INSERT INTO "customers" ("first_name", "last_name", "phone_number", "address")
VALUES ('Ricardo', 'Perez', '555-5678', 'Plaza Mayor 202');
INSERT INTO "customers" ("first_name", "last_name", "phone_number", "address")
VALUES ('Sofia', 'Rodriguez', '555-6789', 'Calle Noche 303');

-- Add new suppliers
INSERT INTO "suppliers" ("name", "email", "website_url", "address")
VALUES ('TechSupplies', 'info@techsupplies.com', 'http://techsupplies.com', 'Calle Industria 123');
INSERT INTO "suppliers" ("name", "email", "website_url", "address")
VALUES ('ElectroGadgets', 'support@electrogadgets.com', 'http://electrogadgets.com', 'Avenida Tecnología 789');
INSERT INTO "suppliers" ("name", "email", "website_url", "address")
VALUES ('SmartSolutions', 'sales@smartsolutions.com', 'http://smartsolutions.com', 'Calle Innovación 456');
INSERT INTO "suppliers" ("name", "email", "website_url", "address")
VALUES ('HomeGoods', 'sales@homegoods.com', 'http://homegoods.com', 'Calle Hogar 101');
INSERT INTO "suppliers" ("name", "email", "website_url", "address")
VALUES ('GreenFresh', 'info@greenfresh.com', 'http://greenfresh.com', 'Avenida Verde 202');

-- Add new categories
INSERT INTO "categories" ("name")
VALUES ('Furniture');
INSERT INTO "categories" ("name")
VALUES ('Clothing');
INSERT INTO "categories" ("name")
VALUES ('Groceries');
INSERT INTO "categories" ("name")
VALUES ('Books');
INSERT INTO "categories" ("name")
VALUES ('Toys');
INSERT INTO "categories" ("name")
VALUES ('Electronics');

-- Add new products (Electronics category)
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Smartphone X', 999.99, 'High-performance smartphone with OLED display', 6, 2);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Laptop Pro', 1299.99, 'Powerful laptop for professionals', 6, 1);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Wireless Earbuds', 199.99, 'Noise-cancelling earbuds with long battery life', 6, 3);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Smartwatch Series 5', 349.99, 'Advanced smartwatch with health tracking', 6, 2);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Gaming Console', 499.99, 'Next-gen gaming console with stunning graphics', 6, 3);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('4K Television', 799.99, 'Ultra HD television with smart features', 6, 2);

-- Add new products (Furniture category)
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Wooden Chair', 79.99, 'Comfortable wooden chair with a modern design', 1, 4);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Office Desk', 199.99, 'Spacious office desk with multiple drawers', 1, 3);

-- Add new products (Clothing category)
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Men\'s Jacket', 59.99, 'Warm and stylish jacket for winter', 2, 5);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Women\'s Dress', 89.99, 'Elegant evening dress', 2, 5);

-- Add new products (Groceries category)
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Organic Apples', 2.99, 'Fresh organic apples (per kg)', 3, 5);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Whole Wheat Bread', 3.49, 'Freshly baked whole wheat bread', 3, 5);

-- Add new products (Books category)
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Science Fiction Novel', 14.99, 'Bestselling sci-fi novel', 4, 2);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Cookbook', 19.99, 'Recipes for healthy living', 4, 3);

-- Add new products (Toys category)
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Action Figure', 24.99, 'Popular action figure for kids', 5, 4);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Board Game', 34.99, 'Family-friendly board game', 5, 3);


-- Add new invoices
INSERT INTO "invoices" ("customer_id", "date")
VALUES (1, '2024-11-20');
INSERT INTO "invoices" ("customer_id", "date")
VALUES (2, '2024-11-21');
INSERT INTO "invoices" ("customer_id", "date")
VALUES (3, '2024-11-22');
INSERT INTO "invoices" ("customer_id", "date")
VALUES (4, '2024-11-23');
INSERT INTO "invoices" ("customer_id", "date")
VALUES (5, '2024-11-24');

-- Add new invoice items (Electronics products)
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (1, 7, 2); -- Smartphone X
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (2, 8, 1); -- Laptop Pro
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (3, 9, 3); -- Wireless Earbuds
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (4, 10, 1); -- Smartwatch Series 5
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (5, 11, 2); -- Gaming Console
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (6, 12, 1); -- 4K Television

-- Update invoices to include items from various categories
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (1, 13, 1); -- Wooden Chair
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (1, 15, 1); -- Men's Jacket
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (2, 17, 2); -- Organic Apples
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (3, 19, 1); -- Science Fiction Novel
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (4, 21, 1); -- Action Figure
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (5, 13, 1); -- Office Desk
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (5, 18, 2); -- Whole Wheat Bread
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (6, 20, 1); -- Cookbook
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (6, 22, 1); -- Board Game

-- Add new invoices
INSERT INTO "invoices" ("customer_id", "date")
VALUES (1, '2024-11-20');
INSERT INTO "invoices" ("customer_id", "date")
VALUES (2, '2024-11-21');
INSERT INTO "invoices" ("customer_id", "date")
VALUES (3, '2024-11-22');
INSERT INTO "invoices" ("customer_id", "date")
VALUES (4, '2024-11-23');
INSERT INTO "invoices" ("customer_id", "date")
VALUES (5, '2024-11-24');

-- Add new invoice items (Electronics products)
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (1, 7, 2); -- Smartphone X
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (2, 8, 1); -- Laptop Pro
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (3, 9, 3); -- Wireless Earbuds
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (4, 10, 1); -- Smartwatch Series 5
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (5, 11, 2); -- Gaming Console
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (6, 12, 1); -- 4K Television