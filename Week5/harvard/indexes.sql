CREATE INDEX "enrollment_by_student_and_course"
ON "enrollments" ("student_id", "course_id");

CREATE INDEX "course_department_title_semester"
ON "courses" ("department", "title", "semester");

CREATE INDEX "courses_on_fall_2023"
ON "courses" ("title", "department", "number")
WHERE "semester" = 'Fall 2023';

CREATE INDEX "enrollment_by_course_id"
ON "enrollments" ("course_id");

CREATE INDEX "satisfies_by_course_id"
ON "satisfies" ("course_id");
