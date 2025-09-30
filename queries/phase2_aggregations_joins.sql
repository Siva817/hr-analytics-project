-- ==================================================
-- HR Analytics Project – Phase 2
-- Aggregations & Joins: GROUP BY, AVG, SUM, basic JOINs, subqueries
-- Questions 11–20
-- ==================================================

-- 11. Count employees in each DepartmentType
SELECT DepartmentType, COUNT(*) AS TotalEmployees
FROM employee_data
GROUP BY DepartmentType;

-- 12. Find average Engagement Score of all employees
SELECT AVG(`Engagement Score`) AS AvgEngagement
FROM employee_engagement_survey_data;

-- 13. List employees whose Performance Score 'Needs Improvement'
SELECT EmpID, FirstName, LastName, `Performance Score`
FROM employee_data
WHERE `Performance Score` = "Needs Improvement";
-- Use backticks (`) for column names with spaces, and quotes (' or ") for string values in rows

-- 14. Find employees who haven’t taken any training
SELECT e.*
FROM employee_data e
LEFT JOIN training_and_development_data t
ON e.EmpID = t.`Employee ID`
WHERE t.`Employee ID` IS NULL;
-- no matching rows found

-- 15. Show total training days per employee
SELECT `Employee ID`, SUM(`Training Duration(Days)`) AS TotalTrainingDays
FROM training_and_development_data
GROUP BY `Employee ID`;

-- 16. Find the top 5 employees with the highest Engagement Score
SELECT `Employee ID`, `Engagement Score`
FROM employee_engagement_survey_data
ORDER BY `Engagement Score` DESC
LIMIT 5;

-- 17. List applicants with more than 5 years of experience
SELECT `Applicant ID`, `First Name`, `Last Name`, `Years of Experience`
FROM recruitment_data
WHERE `Years of Experience` > 5;

-- 18. Find average Satisfaction Score per department
SELECT e.DepartmentType, AVG(s.`Satisfaction Score`) AS AvgSatisfaction
FROM employee_data e
JOIN employee_engagement_survey_data s
ON e.EmpID = s.`Employee ID`
GROUP BY e.DepartmentType;

-- 19. Show total training cost per Training Program Name
SELECT `Training Program Name`, round(SUM(`Training Cost`),2) AS TotalCost
FROM training_and_development_data
GROUP BY `Training Program Name`;

-- 20. Count employees in each State
SELECT State, COUNT(*) AS TotalEmployees
FROM employee_data
GROUP BY State;
