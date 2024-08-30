CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", "property_type", "host_name", "date", COUNT(*) AS "day_vacant"
FROM "listings"
JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE "date" LIKE '2023-06-%' AND "available" == 'TRUE'
GROUP BY "listings"."id";
