/*
write a set of SQL statements to design a database with which Hartsfield-Jackson could keep track of its passengers and their flights.
*/

CREATE TABLE IF NOT EXISTS "passengers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "checkIn"(
    "id" INTEGER,
    "passenger_id" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "date_time" NUMERIC NOT NULL,
    "flight" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES  "passengers"("id"),
    FOREIGN KEY("airline_id") REFERENCES  "airline"("id")
);

CREATE TABLE IF NOT EXISTS "airline"(
    "id" INTEGER,
    "airline_name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D','E','F', 'T' )),
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "flights"(
    "id" INTEGER,
    "flight_number" NUMERIC NOT NULL,
    "airline" TEXT NOT NULL,
    "departing_airport_code" TEXT NOT NULL,
    "headingTo_airport_code" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

