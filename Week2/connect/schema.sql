CREATE TABLE "users" (
    "id" INTEGER,

    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "user_name" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,

    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL CHECK ("type" IN (
        "Elementary School", "Middle School", "High School",
        "Lower School", "Upper School", "College", "University")
    ),
    "location" TEXT NOT NULL,
    "founded_year" INTEGER NOT NULL CHECK("founded_year" > 0),

    PRIMARY KEY ("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "industry" TEXT NOT NULL CHECK ("industry" IN ("Eduaction", "Technology", "Finance")),
    "location" TEXT NOT NULL,

    PRIMARY KEY("id")
);

CREATE TABLE "people_connections" (
    "id" INTEGER,

    "user_id" INTEGER,
    "user_follow_id" INTEGER,

    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("user_follow_id") REFERENCES "users"("id")
);

CREATE TABLE "school_connections" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,

    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC CHECK ("end_date" > "start_date"),

    "degree" TEXT NOT NULL CHECK("degree" IN ("BA", "MA", "PhD")),

    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "company_connections" (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,

    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC CHECK ("end_date" > "start_date"),

    "title" TEXT NOT NULL,

    PRIMARY KEY("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);
