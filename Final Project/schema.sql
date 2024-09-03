-- Clients table
CREATE TABLE "clients" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,

    -- Phone numbers must be between 10 and 15 characters long
    "phone" TEXT NOT NULL CHECK(
        LENGTH(phone) BETWEEN 10 AND 15
    ),

    "address" TEXT NOT NULL,

    PRIMARY KEY("id")
);

-- Orders table, keeps track of the status, price, the date when it was ordered, and delivered if applicable
-- The shipping address can be null because the client may claim the order directly
CREATE TABLE "orders" (
    "id" INTEGER,
    "client_id" INTEGER,

    "status" TEXT NOT NULL CHECK("status" IN ("pending", "started", "finished", "delivered")) DEFAULT "pending",
    "price" NUMERIC CHECK("price" >= 0),
    "order_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deliver_date" NUMERIC,
    "shipping_address" TEXT,

    PRIMARY KEY("id"),
    FOREIGN KEY("client_id") REFERENCES "clients"("id"),
);

-- Client Measurements table, stores additional measurements or details related to clients
-- Assumes that each measurement is uniquely identified and associated with a client
CREATE TABLE "client_measurements" (
    "id" INTEGER,
    "client_id" INTEGER,

    PRIMARY KEY("id"),
    FOREIGN KEY("client_id") REFERENCES "clients"("id")
);
