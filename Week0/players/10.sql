--Query the first name, last name, and country of players under 25 years old
SELECT "first_name", "last_name", "birth_country", (2024 - "birth_year") AS "Age"
FROM "players"
WHERE "age" <= 25
ORDER BY "Age" ASC, "birth_month" DESC, "birth_day" DESC;
