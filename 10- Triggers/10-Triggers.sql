create database teachersdb;
use teachersdb;

-- Create the teachers table
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    experience INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert 8 rows
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice Johnson', 'Math', 5, 50000),
(2, 'Bob Smith', 'Physics', 12, 70000),
(3, 'Catherine Lee', 'Chemistry', 8, 60000),
(4, 'David Brown', 'Biology', 15, 80000),
(5, 'Emma White', 'History', 4, 45000),
(6, 'Frank Miller', 'English', 6, 55000),
(7, 'Grace Wilson', 'Geography', 9, 65000),
(8, 'Henry Davis', 'Computer Science', 2, 40000);

-- Create the before_insert_teacher trigger
DELIMITER //
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //
DELIMITER ;

-- Create the teacher_log table
CREATE TABLE teacher_log (
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

-- Create the after_insert_teacher trigger
DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END //
DELIMITER ;

-- Create the before_delete_teacher trigger
DELIMITER //
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete a teacher with experience greater than 10 years';
    END IF;
END //
DELIMITER ;

-- Create the after_delete_teacher trigger
DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END //
DELIMITER ;
