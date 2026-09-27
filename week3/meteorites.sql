-- 1. Reset tables
DROP TABLE IF EXISTS "meteorites_temp";
DROP TABLE IF EXISTS "meteorites";

-- 2. Temporary table matching ALL 10 columns of meteorites.csv
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "recclass" TEXT,
    "mass" REAL,
    "fall" TEXT,
    "year" INTEGER,
    "reclat" REAL,
    "reclong" REAL,
    "geolocation" TEXT
);

-- 3. Import raw CSV data
.import --csv --skip 1 meteorites.csv meteorites_temp

-- 4. Convert empty strings to NULL
UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '';
UPDATE "meteorites_temp" SET "reclat" = NULL WHERE "reclat" = '';
UPDATE "meteorites_temp" SET "reclong" = NULL WHERE "reclong" = '';

-- 5. Round numeric values to 2 decimal places
UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2) WHERE "mass" IS NOT NULL;
UPDATE "meteorites_temp" SET "reclat" = ROUND("reclat", 2) WHERE "reclat" IS NOT NULL;
UPDATE "meteorites_temp" SET "reclong" = ROUND("reclong", 2) WHERE "reclong" IS NOT NULL;

-- 6. Filter out relict meteorites
DELETE FROM "meteorites_temp" WHERE LOWER("nametype") = 'relict';

-- 7. Create final destination table (with auto-incrementing id)
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

-- 8. Transfer and sort cleaned data into final table
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "recclass", "mass", "fall", "year", "reclat", "reclong"
FROM "meteorites_temp"
ORDER BY "year" ASC, "name" ASC;

-- 9. Clean up temporary table
DROP TABLE IF EXISTS "meteorites_temp";
