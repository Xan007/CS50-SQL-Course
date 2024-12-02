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

-- Find the total amount of products sold for an invoice (price * quantity)
SELECT "invoice_id", "total"
FROM "invoice_totals" -- this is a view
WHERE "invoice_id" = 1;


-- Find the total number of products sold by category
SELECT "name", "total_products_sold"
FROM "category_sales" -- this is a view
WHERE "name" = 'Electronics';

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
VALUES ('GroceryMart', 'contact@grocerymart.com', 'http://grocerymart.com', 'Avenida Central 456');
INSERT INTO "suppliers" ("name", "email", "website_url", "address")
VALUES ('FashionHub', 'support@fashionhub.com', 'http://fashionhub.com', 'Calle Moda 789');
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

-- Add new products
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Sofa', 499.99, 'Comfortable 3-seater sofa', 1, 1);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('T-shirt', 19.99, 'Cotton t-shirt', 2, 3);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Apple', 1.99, 'Fresh red apple', 3, 4);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Novel Book', 12.99, 'A thrilling mystery novel', 4, 5);
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Lego Set', 29.99, 'Fun Lego building set for kids', 5, 2);

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

-- Add new invoice items
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (1, 1, 2);
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (2, 2, 5);
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (3, 3, 10);
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (4, 4, 1);
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (5, 5, 3);

-- Add more data for diversity
INSERT INTO "customers" ("first_name", "last_name", "phone_number", "address")
VALUES ('Julia', 'Garcia', '555-7890', 'Calle Real 505');
INSERT INTO "suppliers" ("name", "email", "website_url", "address")
VALUES ('BeautyCosmetics', 'contact@beautycosmetics.com', 'http://beautycosmetics.com', 'Calle Belleza 888');
INSERT INTO "categories" ("name")
VALUES ('Beauty Products');
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Shampoo', 4.99, 'Anti-dandruff shampoo', 6, 6);
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (6, 6, 2);