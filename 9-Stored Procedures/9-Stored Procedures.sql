create database workersdb;
use workersdb;

CREATE TABLE worker (
    Worker_Id INT,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

INSERT INTO worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 
(1, 'John', 'Doe', 50000, '2023-01-01', 'HR'),
(2, 'Jane', 'Smith', 60000, '2023-02-01', 'Finance'),
(3, 'Mike', 'Brown', 55000, '2023-03-01', 'IT'),
(4, 'Emily', 'Davis', 45000, '2023-04-01', 'Marketing'),
(5, 'Chris', 'Johnson', 70000, '2023-05-01', 'Finance'),
(6, 'Pat', 'Wilson', 52000, '2023-06-01', 'IT'),
(7, 'Taylor', 'Moore', 58000, '2023-07-01', 'HR'),
(8, 'Jordan', 'Lee', 49000, '2023-08-01', 'Marketing'),
(9, 'Alex', 'White', 67000, '2023-09-01', 'Finance'),
(10, 'Sam', 'Taylor', 56000, '2023-10-01', 'IT');

DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END$$

DELIMITER ;

-- Procedure Call
CALL AddWorker(11, 'Sophia', 'Adams', 62000, '2023-11-01', 'HR');

DELIMITER $$

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM worker
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;

-- Procedure Call
SET @workerId = 1;
CALL GetWorkerSalary(@workerId, @salary);
SELECT @salary AS Salary;

DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;

-- Procedure Call
CALL UpdateWorkerDepartment(1, 'IT');

DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM worker
    WHERE Department = p_Department;
END$$

DELIMITER ;

-- Procedure Call
SET @department = 'Finance';
CALL GetWorkerCountByDepartment(@department, @workerCount);
SELECT @workerCount AS WorkerCount;

DELIMITER $$

CREATE PROCEDURE GetAvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM worker
    WHERE Department = p_Department;
END$$

DELIMITER ;

-- Procedure Call
SET @department = 'Finance';
CALL GetAvgSalaryByDepartment(@department, @avgSalary);
SELECT @avgSalary AS AvgSalary;
