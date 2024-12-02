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

-- Add a new customer
INSERT INTO "customers" ("first_name", "last_name", "phone_number", "address")
VALUES ('Carlos', 'Martínez', '555-1234', 'Calle Falsa 123');

-- Add a new supplier
INSERT INTO "suppliers" ("name", "email", "website_url", "address")
VALUES ('Supplier XYZ', 'contact@xyz.com', 'http://xyz.com', 'Av. Siempre Viva 456');

-- Add a new product
INSERT INTO "products" ("name", "price", "description", "category_id", "supplier_id")
VALUES ('Laptop', 799.99, 'High-end laptop', 1, 2);

-- Add a new invoice
INSERT INTO "invoices" ("customer_id", "date")
VALUES (1, '2024-12-01');

-- Add a new invoice item
INSERT INTO "invoice_items" ("invoice_id", "product_id", "quantity")
VALUES (1, 1, 3);

