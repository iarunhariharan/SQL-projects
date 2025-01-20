1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows.
2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero.
3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.
4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.
5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
