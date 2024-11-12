
ALTER TABLE IF EXISTS public."CourseTeacher"
    ADD CONSTRAINT course_id FOREIGN KEY (course_id)
    REFERENCES public."Course" (course_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."CourseTeacher"
    ADD CONSTRAINT teacher_id FOREIGN KEY (teacher_id)
    REFERENCES public."Teacher" (teacher_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."Enrollment"
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id)
    REFERENCES public."Course" (course_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."Enrollment"
    ADD CONSTRAINT enrollments_group_id_fkey FOREIGN KEY (group_id)
    REFERENCES public."Group" (group_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."Schedule"
    ADD CONSTRAINT "Schedule_holiday_id_fkey" FOREIGN KEY (holiday_id)
    REFERENCES public."Holiday" (holiday_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;


ALTER TABLE IF EXISTS public."Schedule"
    ADD CONSTRAINT schedule_enrrollment_id_fkey FOREIGN KEY (enrollment_id)
    REFERENCES public."Enrollment" (enrollment_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Schedule"
    ADD CONSTRAINT schedule_lesson_id_fkey FOREIGN KEY (time_table_id)
    REFERENCES public."TimeTable" (time_table_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Schedule"
    ADD CONSTRAINT schedule_room_id_fkey FOREIGN KEY (room_id)
    REFERENCES public."Room" (room_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."Student"
    ADD CONSTRAINT students_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public."City" (city_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."StudentGroup"
    ADD CONSTRAINT group_id_fkey FOREIGN KEY (group_id)
    REFERENCES public."Group" (group_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."StudentGroup"
    ADD CONSTRAINT student_id_fkey FOREIGN KEY (student_id)
    REFERENCES public."Student" (student_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Teacher"
    ADD CONSTRAINT teachers_city_id_fkey FOREIGN KEY (city_id)
    REFERENCES public."City" (city_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;