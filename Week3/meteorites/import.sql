CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,

    PRIMARY KEY("id")
);

CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" INTEGER,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = "";

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = "";


UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = "";


UPDATE "meteorites_temp"
SET "discovery" = NULL
WHERE "discovery" = "";

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = "";

DELETE FROM "meteorites_temp"
WHERE "nametype" = "Relict";

UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2), "lat" = ROUND("lat", 2), "long" = ROUND("long", 2);

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp"
ORDER BY "year" ASC, "name" ASC;


DROP TABLE "meteorites_temp";
