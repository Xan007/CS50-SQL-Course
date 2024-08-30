SELECT "city", COUNT(*) AS "Amount of Public Schools"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "Amount of Public Schools" <= 3
ORDER BY "Amount of Public Schools" DESC, "city";
