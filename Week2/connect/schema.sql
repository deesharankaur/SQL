/* write a set of SQL statements to design a database LinkedIn could use.

Specification
Your task at hand is to create a SQLite database for LinkedIn from scratch, as by writing a set of CREATE TABLE statements in a schema.sql file. The implementation details are up to you, though you should minimally ensure that your database meets the platform’s specification and that it can represent the given sample data.
*/

CREATE TABLE IF NOT EXISTS "users"(
    "id" INTEGER PRIMARY KEY,
"firstName" TEXT,
"lastName" TEXT,
"username" TEXT UNIQUE NOT NULL,
"password" TEXT
);

CREATE TABLE IF NOT EXISTS "school_university"(
    "id" INTEGER PRIMARY KEY,
    "SchoolName" TEXT,
    "type" TEXT CHECK("type" in ('Elementary School', 'Middle School','High School', 'Lower School','Upper School', 'College', 'University')),
    "location" TEXT,
    "found_year" INTEGER
);

CREATE TABLE IF NOT EXISTS  "companies"(
    "id" INTEGER PRIMARY KEY,
    "company_name" TEXT,
    "industry" TEXT,
    "location" TEXT
);

CREATE TABLE IF NOT EXISTS "connections"(
    "id" INTEGER,
    "user_id" INTEGER,
    "user_connect_id" INTEGER,
    "school_id" INTEGER,
    "degree" TEXT,
    "type_degree" TEXT,
    "company_id" INTEGER,
    "title" TEXT,
    "start" INTEGER,
    "end" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "user"("id"),
    FOREIGN KEY ("user_connect_id") REFERENCES "users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "school_university"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")

);
