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
    FOREIGN KEY("client_id") REFERENCES "clients"("id")
);

-- Client Measurements table, stores measurements related to clients.
-- The composite primary key (client_id, measured_date) ensures that each client
-- can have only one set of measurements per date.
CREATE TABLE "client_measurements" (
    "client_id" INTEGER,
    "measured_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,

    "height" NUMERIC(5, 2),
    "chest" NUMERIC(5, 2),
    "waist" NUMERIC(5, 2),
    "hips" NUMERIC(5, 2),
    "neck" NUMERIC(5, 2),
    "sleeve" NUMERIC(5, 2),
    "back" NUMERIC(5, 2),
    "front_waist" NUMERIC(5, 2),
    "back_waist" NUMERIC(5, 2),
    "inseam" NUMERIC(5, 2),
    "thigh" NUMERIC(5, 2),

    PRIMARY KEY("client_id", "measured_date"),
    FOREIGN KEY("client_id") REFERENCES "clients"("id")
);
