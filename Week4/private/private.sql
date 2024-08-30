CREATE TABLE "triplets" (
    "sentence_id" INTEGER,
    "start_at" INTEGER,
    "length" INTEGER,

    FOREIGN KEY ("sentence_id") REFERENCES "sentences"("id")
);

INSERT INTO "triplets"
VALUES
(14,98,4),
(114,3,5),
(618,72,9),
(630,7,3),
(932,12,5),
(2230,50,7),
(2346,44,10),
(3041,14,5);

CREATE VIEW "message" AS
SELECT GROUP_CONCAT(substr("sentence", "start_at", "length"), ' ') as "phrase"
FROM "triplets"
JOIN "sentences" ON "triplets"."sentence_id" = "sentences"."id";
