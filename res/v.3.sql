CREATE OR REPLACE VIEW public."ScheduleWithHolidayStatus" AS
SELECT 
    s.schedule_id,
    s.room_id,
    s."schedulе_date",
    s.time_table_id,
    s.enrollment_id,
    s.holiday_id,
    -- Проверка на то, является ли день праздничным
    CASE WHEN h.holiday_date IS NOT NULL THEN TRUE ELSE FALSE END AS is_holiday,
    h.holiday_name -- Название праздника, если день является праздничным
FROM 
    public."Schedule" s
LEFT JOIN 
    public."Holiday" h
ON 
    s."schedulе_date" = h.holiday_date;

	CREATE TABLE IF NOT EXISTS public."ScheduleType" (
    schedule_type_id SERIAL PRIMARY KEY,
    schedule_type_name VARCHAR(50) NOT NULL,
    description TEXT
);
ALTER TABLE public."TimeTable"
    ADD COLUMN schedule_type_id INTEGER,
    DROP COLUMN schedule_type,
    ADD CONSTRAINT fk_schedule_type
    FOREIGN KEY (schedule_type_id)
    REFERENCES public."ScheduleType" (schedule_type_id)
    ON DELETE SET NULL;

SELECT * FROM public."Holiday"
ORDER BY holiday_id ASC 

INSERT INTO public."Holiday" (
holiday_id, holiday_date, holiday_name) VALUES (
'1'::integer, '01/01/2024'::date, 'Новый год'::character varying)
 returning holiday_id;

 SELECT * FROM public."Schedule"
ORDER BY schedule_id ASC 

SELECT * FROM public."ScheduleWithHolidayStatus"
