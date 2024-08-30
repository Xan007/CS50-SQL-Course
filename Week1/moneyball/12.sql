SELECT "first_name", "last_name"
FROM (
    SELECT "first_name", "last_name"
    FROM "players"
    JOIN "salaries" ON "salaries"."player_id" = "players"."id"
    JOIN "performances" ON "performances"."player_id" = "players"."id"
    AND "performances"."year" = "salaries"."year"
    WHERE "performances"."H" > 0 AND "salaries"."year" = 2001
    ORDER BY ("salaries"."salary" / "performances"."H") ASC
    LIMIT 10
)

INTERSECT

SELECT "first_name", "last_name"
FROM (
    SELECT "first_name", "last_name"
    FROM "players"
    JOIN "salaries" ON "salaries"."player_id" = "players"."id"
    JOIN "performances" ON "performances"."player_id" = "players"."id"
    AND "performances"."year" = "salaries"."year"
    WHERE "performances"."RBI" > 0 AND "salaries"."year" = 2001
    ORDER BY ("salaries"."salary" / "performances"."RBI") ASC
    LIMIT 10
)

ORDER BY "last_name" ASC, "first_name" ASC;
