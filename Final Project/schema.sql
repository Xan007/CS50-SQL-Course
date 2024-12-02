-- Represents customers that buy products
CREATE TABLE "customers" (
    "customer_id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "phone_number" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    PRIMARY KEY("customer_id")
);

-- Represents product categories
CREATE TABLE "categories" (
    "category_id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("category_id")
);

-- Represents suppliers providing products to the supermarket, storing their contact and business details.
CREATE TABLE "suppliers" (
    "supplier_id" INTEGER,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "website_url" TEXT,
    "address" TEXT NOT NULL,
    PRIMARY KEY("supplier_id")
);

-- Represents products sold in the supermarket, linking each product to a category and a supplier.
CREATE TABLE "products" (
    "product_id" INTEGER,
    "name" TEXT NOT NULL,
    "price" REAL NOT NULL CHECK("price" >= 0),
    "description" TEXT,
    "category_id" INTEGER,
    "supplier_id" INTEGER,
    PRIMARY KEY("product_id"),
    FOREIGN KEY("category_id") REFERENCES "categories"("category_id"),
    FOREIGN KEY("supplier_id") REFERENCES "suppliers"("supplier_id")
);

-- Represents sales transactions, linking customers to their respective invoices.
CREATE TABLE "invoices" (
    "invoice_id" INTEGER,
    "customer_id" INTEGER NOT NULL,
    "date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("invoice_id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id")
);

-- Represents individual items in an invoice, linking products to invoices with quantities.
CREATE TABLE "invoice_items" (
    "invoice_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL CHECK("quantity" >= 0),
    PRIMARY KEY("invoice_id", "product_id"),
    FOREIGN KEY("invoice_id") REFERENCES "invoices"("invoice_id"),
    FOREIGN KEY("product_id") REFERENCES "products"("product_id")
);

-- INDEXES

-- Indexes for the "customers" table:
CREATE INDEX "customer_name_search" ON "customers" ("first_name", "last_name");

-- Indexes for the "invoices" table:
CREATE INDEX "invoice_customer_id_search" ON "invoices" ("customer_id");

-- Indexes for the "categories" table:
CREATE INDEX "category_name_search" ON "categories" ("name");

-- Indexes for the "products" table:
CREATE INDEX "product_category_id_search" ON "products" ("category_id");
CREATE INDEX "product_supplier_id_search" ON "products" ("supplier_id");
CREATE INDEX "products_product_id_search" ON "products" ("product_id");

-- Indexes for the "invoice_items" table:
CREATE INDEX "invoice_items_invoice_id_search" ON "invoice_items" ("invoice_id");
CREATE INDEX "invoice_items_product_id_search" ON "invoice_items" ("product_id");

--- VIEWS
CREATE VIEW "invoice_totals" AS
SELECT "invoice_id", SUM("products"."price" * "invoice_items"."quantity") AS total
FROM "invoice_items"
JOIN "products" ON "invoice_items"."product_id" = "products"."product_id"
GROUP BY "invoice_id";

CREATE VIEW "category_sales" AS
SELECT "categories"."name", SUM("invoice_items"."quantity") AS total_products_sold
FROM "invoice_items"
JOIN "products" ON "invoice_items"."product_id" = "products"."product_id"
JOIN "categories" ON "products"."category_id" = "categories"."category_id"
GROUP BY "categories"."name";
