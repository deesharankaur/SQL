CREATE TABLE "text"(
    "first" INTEGER,
    "second" INTEGER,
    "third" INTEGER
);

INSERT INTO "text"("first", "second", "third")
    VALUES
    (14,98,4),
    (114,3,5),
    (618,72,9),
    (630,7,3),
    (932,12,5),
    (2230,50,7),
    (2346,44,10),
    (3041,14,5);

CREATE VIEW message AS
SELECT substr(s."sentence", t."second", t."third") AS "phrase"
FROM sentences s
JOIN text t ON s."id" = t."first"
WHERE t."first" != '';

/*
Your task at hand is to decode the cipher left for you by the detective. How you do so is up to you, but you should ensure that—at the end of your process—you have a view structured as follows:

The view should be named message
The view should have a single column, phrase
When the following SQL query is executed on private.db, your view should return a single column in which each row is one phrase in the message.
SELECT "phrase" FROM "message";
In private.sql, you should write all SQL statements required to replicate your creation of the view. That is:

If creating the view requires creating a separate table and inserting data into it, you should ensure that private.sql contains the statements to create that table and insert that data. (Don’t be afraid to add tables and add data as you wish!)
private.sql, when run a fresh instance of private.db, should be able to fully reconstruct your view.
*/
