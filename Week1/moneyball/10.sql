-- why do you think Todd Zeile appears to have two different salaries (and two different HR counts) for the same year?
-- He scored some homeruns in another team in the same year

SELECT "first_name", "last_name", "salary", "salaries"."year", "HR"
FROM "players"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
JOIN "performances"
    ON "performances"."player_id" = "players"."id"
    AND "performances"."year" = "salaries"."year"
ORDER BY
    "players"."id",
    "performances"."year" DESC,
    "HR" DESC,
    "salary" DESC;
