/*
Hits are great, but so are RBIs! In 12.sql, write a SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.

Your query should return a table with two columns, one for the players’ first names and one of their last names.
You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).
Keep in mind the lessons you’ve learned in 10.sql and 11.sql!
*/

SELECT first_name, last_name
FROM(
    SELECT first_name, last_name, id
    FROM players
    WHERE id IN (
        SELECT pl.id
        FROM "performances" p
        JOIN "salaries" s ON p."player_id" = s."player_id" AND p."year" = s."year"
        JOIN "players" pl ON p."player_id" = pl."id"
        WHERE p."H" > 0 AND p."year" = '2001' AND s."year" = '2001'
        ORDER BY s."salary"/p."H" LIMIT 10)

    INTERSECT

    SELECT first_name, last_name, id
    FROM players
    WHERE id IN (
        SELECT pl.id
        FROM "performances" p
        JOIN "salaries" s ON p."player_id" = s."player_id" AND p."year" = s."year"
        JOIN "players" pl ON p."player_id" = pl."id"
        WHERE p."RBI" > 0 AND p."year" = '2001' AND s."year" = '2001'
        ORDER BY s."salary"/p."RBI" LIMIT 10)
) AS subquery
ORDER BY id;
