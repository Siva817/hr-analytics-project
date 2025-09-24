-- ==================================================
-- HR Analytics Project – Phase 1
-- Getting Comfortable: SELECT, WHERE, basic filters
-- Questions 1–10
-- ==================================================

-- 1. List all employees’ first and last names
SELECT FirstName, LastName
FROM employee_data;

-- 2. Show all employees who work in the "IT" department
SELECT *
FROM employee_data
WHERE DepartmentType = 'IT';

-- 3. Count the total number of employees
SELECT COUNT(*) AS TotalEmployees
FROM employee_data;

-- 4. List employees whose EmployeeStatus is 'Terminated'
SELECT *
FROM employee_data
WHERE EmployeeStatus = 'Terminated';

-- 5. Find employees born after 1990-01-01
SELECT *
FROM employee_data
WHERE DOB > '1990-01-01';

-- 6. Show all employees with GenderCode = 'F'
SELECT *
FROM employee_data
WHERE GenderCode = 'F';

-- 7. List all applicants for the job title "Software Engineer"
SELECT *
FROM recruitment_data
WHERE `Job Title` = 'Software Engineer';

-- 8. Count the number of applicants by Gender
SELECT Gender, COUNT(*) AS TotalApplicants
FROM recruitment_data
GROUP BY Gender;

-- 9. Show all trainings attended by employee with Employee ID = 101
SELECT *
FROM training_and_development_data
WHERE `Employee ID` = 101;

-- 10. List employees along with their supervisor names
SELECT FirstName, LastName, Supervisor
FROM employee_data;
