CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" NUMERIC NOT NULL CHECK("price_per_unit" >= 0),

    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,

    "name" TEXT NOT NULL,
    "has_gluten" BOOLEAN,
    "price" NUMERIC NOT NULL CHECK("price" > 0),

    PRIMARY KEY("id")
);

-- Ingredients per donut with their amount
CREATE TABLE "donut_ingredients" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    "amount" INTEGER NOT NULL CHECK("amount" > 0) DEFAULT 1,

    PRIMARY KEY("donut_id", "ingredient_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,

    PRIMARY KEY("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "customer_id" INTEGER,
    "order_number" INTEGER,

    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "order_donuts" (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "amount" INTEGER NOT NULL CHECK("amount" > 0),
    PRIMARY KEY("order_id", "donut_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

-- To know the history orders of a customer we need to do a query with customer id in table "orders",
-- then access order_donuts with the order_id in the previous
