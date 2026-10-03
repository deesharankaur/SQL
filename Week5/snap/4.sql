/*The app needs to send users a summary of their engagement. 
Find the username of the most popular user, defined as the user who has had the most messages sent to them.

Ensure your query uses the search_messages_by_to_user_id index, which is defined as follows:

CREATE INDEX "search_messages_by_to_user_id"
ON "messages"("to_user_id");
*/

SELECT u."username" FROM "users" u
WHERE u."id" =(
    SELECT m."to_user_id" FROM "messages" m
    GROUP BY m."to_user_id"
    ORDER BY COUNT(m."id") DESC
    LIMIT 1
);
