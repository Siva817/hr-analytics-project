-- ==================================================
-- HR Analytics Project – Phase 3
-- Advanced Analytics & Complex Queries: Window functions, multi-table joins, nested queries, ranking
-- Questions 21–30
-- ==================================================

-- 21. List employees with engagement score above the average engagement score
SELECT e.EmpID, e.FirstName, e.LastName, s.`Engagement Score`
FROM employee_data e
JOIN employee_engagement_survey_data s
ON e.EmpID = s.`Employee ID`
WHERE s.`Engagement Score` > (SELECT AVG(`Engagement Score`) FROM employee_engagement_survey_data);

-- 22. Find employees who joined after 2018-01-01 and are still active
SELECT EmpID, FirstName, LastName, StartDate
FROM employee_data
WHERE str_to_date(StartDate, '%d-%b-%y') > '2018-01-01' AND EmployeeStatus = 'Active';

-- 23. Count employees per JobFunctionDescription and GenderCode
SELECT JobFunctionDescription, GenderCode, COUNT(*) AS TotalEmployees
FROM employee_data
GROUP BY JobFunctionDescription, GenderCode
order by JobFunctionDescription;

-- 24. List employees along with the number of trainings they attended
SELECT e.EmpID, e.FirstName, e.LastName, COUNT(t.`Training Program Name`) AS TrainingsAttended
FROM employee_data e
LEFT JOIN training_and_development_data t
ON e.EmpID = t.`Employee ID`
GROUP BY e.EmpID, e.FirstName, e.LastName;

-- 25. Show average Work-Life Balance Score per BusinessUnit
SELECT e.BusinessUnit, round(AVG(s.`Work-Life Balance Score`),2) AS AvgWorkLifeBalance
FROM employee_data e
JOIN employee_engagement_survey_data s
ON e.EmpID = s.`Employee ID`
GROUP BY e.BusinessUnit;

-- 26. List employees whose last training outcome was "Failed"
SELECT t1.`Employee ID`, e.FirstName, e.LastName, t1.`Training Outcome`
FROM training_and_development_data t1
JOIN employee_data e
ON t1.`Employee ID` = e.EmpID
WHERE t1.`Training Date` = (
    SELECT MAX(t2.`Training Date`)
    FROM training_and_development_data t2
    WHERE t2.`Employee ID` = t1.`Employee ID`
)
AND t1.`Training Outcome` = 'Failed';

-- 27. Find employees who left (ExitDate is not null) within 1 year of joining
SELECT EmpID, FirstName, LastName, StartDate, ExitDate
FROM employee_data
WHERE ExitDate IS NOT NULL
AND DATEDIFF(STR_TO_DATE(ExitDate, '%d-%b-%y'), STR_TO_DATE(StartDate, '%d-%b-%y')) <= 365;

-- 28. Show top 3 departments with the highest average engagement score
SELECT e.DepartmentType, AVG(s.`Engagement Score`) AS AvgEngagement
FROM employee_data e
JOIN employee_engagement_survey_data s
ON e.EmpID = s.`Employee ID`
GROUP BY e.DepartmentType
ORDER BY AvgEngagement DESC
LIMIT 3;

-- 29. Employees with highest training cost
SELECT t.`Employee ID`, e.FirstName, e.LastName, ROUND(SUM(t.`Training Cost`),2) AS TotalCost  
FROM training_and_development_data t  
JOIN employee_data e  
ON t.`Employee ID` = e.EmpID  
GROUP BY t.`Employee ID`, e.FirstName, e.LastName  
ORDER BY TotalCost DESC  
LIMIT 5;


-- 30. Employees with engagement score below department average
SELECT e.EmpID, e.FirstName, e.LastName, e.DepartmentType, s.`Engagement Score`  
FROM employee_data e  
JOIN employee_engagement_survey_data s  
ON e.EmpID = s.`Employee ID`  
WHERE s.`Engagement Score` < (  
  SELECT AVG(s2.`Engagement Score`)  
  FROM employee_data e2  
  JOIN employee_engagement_survey_data s2  
  ON e2.EmpID = s2.`Employee ID`  
  WHERE e2.DepartmentType = e.DepartmentType
);

