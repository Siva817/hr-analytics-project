-- ==================================================
-- HR Analytics Project – Phase 1
-- Getting Comfortable: SELECT, WHERE, basic filters
-- Questions 1–10
-- ==================================================

-- 1. List all employees’ first and last names
SELECT FirstName, LastName
FROM employee_data;

-- 2. Show all employees who work in the "IT/IS" department
SELECT *
FROM employee_data
WHERE DepartmentType = 'IT/IS';

-- 3. Count the total number of employees
SELECT COUNT(*) AS TotalEmployees
FROM employee_data;

-- 4. List employees whose EmployeeStatus is 'Terminated'
SELECT *
FROM employee_data
WHERE EmployeeStatus LIKE '%terminated%';
-- Using LIKE '%terminated%' instead of '=' because the EmployeeStatus column contains values 
-- like 'Voluntarily Terminated' and 'Terminated for Cause'


-- 5. Find employees born after 1990-01-01
-- Convert DOB from DD-MM-YYYY text to DATE for comparison
SELECT *
FROM employee_data
WHERE str_to_date(DOB, '%d-%m-%Y') > '1990-01-01';

-- 6. Show all employees with GenderCode = 'Female'
SELECT *
FROM employee_data
WHERE GenderCode = 'Female';

-- 7. List all applicants for the job title "Software Engineer"
SELECT *
FROM recruitment_data
WHERE `Job Title` = 'Software Engineer';

-- 8. Count the number of applicants by Gender
SELECT Gender, COUNT(*) AS TotalApplicants
FROM recruitment_data
GROUP BY Gender;

-- 9. Show all trainings attended by employee with Employee ID = 1001
SELECT *
FROM training_and_development_data
WHERE `Employee ID` = 1001;

-- 10. List employees along with their supervisor names
SELECT FirstName, LastName, Supervisor
FROM employee_data;
