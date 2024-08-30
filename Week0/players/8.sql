SELECT
    ROUND(AVG("height"), 2) as "Average Height",
    ROUND(AVG("weight"), 2) AS "Average Weight"
FROM "players"
    WHERE "debut" LIKE '2%';
