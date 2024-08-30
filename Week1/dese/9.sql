SELECT "name"
FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
ORDER BY "pupils" ASC
LIMIT 1;
