CREATE INDEX "student_id_index"
ON "enrollments"("student_id");

CREATE INDEX "enrollment_course_id_index"
ON "enrollments"("course_id");

CREATE INDEX "course_dept_index"
ON "courses"("department");

CREATE INDEX "course_id_index"
ON "courses"("id");

CREATE INDEX "course_semester_index"
ON "courses"("semester");

CREATE INDEX "course_title_index"
ON "courses"("title");

/*In indexes.sql, write a set of SQL statements that create indexes which will speed up typical queries on the harvard.db database. 
The number of indexes you create, as well as the columns they include, is entirely up to you. 
Be sure to balance speed with disk space, only creating indexes you need.

When engineers optimize a database, they often care about the typical queries run on the database. 
Such queries highlight patterns with which a database is accessed, thus revealing the best columns and tables on which to create indexes. 
*/
