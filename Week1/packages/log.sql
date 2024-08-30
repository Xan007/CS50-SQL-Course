
-- *** The Lost Letter ***

-- From: 900 Somerville Avenue
-- To: 2 Finnegan Street, uptown (??)

-- Get the packages sent from 900 Somerville Avenue
SELECT *
FROM "packages"
WHERE "from_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
);

-- Now that we know all the contents of the packages, we can get the id for the one required
SELECT "id" FROM "packages" WHERE "contents" = 'Congratulatory letter';

-- Lets check where the package was dropped
SELECT *
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "contents" = 'Congratulatory letter'
    )
    AND "action" = 'Drop'
);

-- *** The Devious Delivery ***

--Fiftyville

-- Packages with from address null. Only one, id = 5098
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;
SELECT * FROM "scans" WHERE "package_id" = 5098 AND "action" = 'Drop';

SELECT *
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" IS NULL
    )
    AND "action" = 'Drop'
);

-- *** The Forgotten Gift ***
-- From: 109 Tileston Street
-- To: 728 Maple Place

SELECT *
FROM "packages"
WHERE "from_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '109 Tileston Street'
) AND "to_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '728 Maple Place'
)

SELECT *
FROM "scans"
WHERE "package_id" = (
    SELECT "id"
    FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id"
        FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    ) AND "to_address_id" = (
        SELECT "id"
        FROM "addresses"
        WHERE "address" = '728 Maple Place'
    )
);

-- The package was Dropped at 728 Maple Place and 6 days later was Picked up again y driver_id = 17
-- Getting info of driver
SELECT * FROM "drivers" WHERE "id" = 17;
