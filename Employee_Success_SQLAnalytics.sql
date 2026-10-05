SELECT *
FROM attendance

SELECT *
FROM employee

SELECT *
FROM department

SELECT *
FROM performance

SELECT *
FROM salary

SELECT *
FROM turnover

--Question 1: Who are the top 5 highest serving employees?
----LOGIC :Top 5 employees that have stayed the longest
--COLUNM(S):c. employee_id, e.firstname,e.lastname, e.hiredate
--TABLE: employee
--Key synthax: ORDER BY, LIMIT 
SELECT e.employee_id, concat(e.first_name, ' ', e.last_name) 
AS Full_name, e.hire_date
FROM employee e
ORDER BY "hire_date" ASC
LIMIT 5;

--OR 
SELECT employee_id, concat(first_name,' ',last_name) AS full_name, hire_date,
  CURRENT_DATE - hire_date AS days_served
FROM employee
ORDER BY hire_date ASC
LIMIT 5;

--Question 2: What is the turnover rate for each department?
----LOGIC :Percentage/ number of people that left each department
--COLUNM(S):d.department_name, t.turnover
--TABLE: Department, Turnover 
--Common column: department_id
--Key synthax: JOIN 
SELECT d.department_name, ROUND(CAST(COUNT(t.turnover_id)AS DECIMAL) / 
COUNT(e.employee_id) * 100, 2) AS turnover_rate_percent
FROM department d
JOIN employee e ON d.department_id = e.department_id
LEFT JOIN turnover t ON e.employee_id = t.employee_id
GROUP BY d.department_name
ORDER BY turnover_rate_percent DESC;

--Question 3: Which employees are at risk of leaving based on their performance?
SELECT employee_id,
        ROUND(AVG(performance_score), 2) AS avg_score
    FROM performance
    GROUP BY employee_id
	ORDER BY avg_score;

--Actual answer 
SELECT  e.employee_id,
  CONCAT(e.first_name, ' ', e.last_name) AS full_name,
  d.department_name,
  COUNT(p.performance_id) AS total_reviews,
  ROUND(AVG(p.performance_score), 2) AS avg_performance_score,
  CASE 
    WHEN AVG(p.performance_score) <= 3.0 THEN 'High Risk'
    WHEN AVG(p.performance_score) <= 3.5 THEN 'Moderate Risk'
    ELSE 'Low Risk'
  END AS risk_level
FROM employee e
JOIN performance p ON p.employee_id = e.employee_id
JOIN department d ON e.department_id = d.department_id
GROUP BY e.employee_id, full_name, d.department_name
HAVING AVG(p.performance_score) <= 3.5
ORDER BY avg_performance_score;
--Question 4: What are the main reasons employees are leaving the company?
SELECT 
    t.reason_for_leaving,
    COUNT(*) AS number_of_exits,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_of_total_exits
FROM turnover t
JOIN employee e ON t.employee_id = e.employee_id
GROUP BY t.reason_for_leaving
ORDER BY number_of_exits DESC;

--SECTION 2.Performance Analysis
--Question 1:How many employees has left the company?
SELECT COUNT(*) AS employees_left
FROM employee e
LEFT JOIN turnover t ON t.employee_id = e.employee_id
WHERE turnover_id IS NOT NULL;
--OR
SELECT COUNT(*)AS employees_left
FROM turnover;

--Question2: How many employees have a performance score of 5.0 / below 3.5?  
SELECT COUNT(DISTINCT employee_id) as employee_count
FROM performance 
WHERE performance_score = 5 or performance_score<3.5;


--This is not an answer tho
SELECT e.employee_id,
  CONCAT(e.first_name, ' ', e.last_name) AS full_name,
  d.department_name,
  ROUND(AVG(p.performance_score), 2) AS avg_score,
  CASE 
    WHEN AVG(p.performance_score) = 5.0 THEN 'Top Performer'
    WHEN AVG(p.performance_score) < 3.5 THEN 'Low Performer'
  END AS performance_category
FROM performance p
JOIN employee e ON p.employee_id = e.employee_id
JOIN department d ON e.department_id = d.department_id
GROUP BY e.employee_id, full_name, d.department_name
HAVING AVG(p.performance_score) = 5.0 OR AVG(p.performance_score) < 3.5
ORDER BY avg_score DESC;

--Question3: Which department has the most employees with a performance of 5.0 / below 3.5?
SELECT d.department_name, COUNT(DISTINCT p.employee_id) AS employee_count
FROM performance p
JOIN department d ON p.department_id=d.department_id
WHERE p.performance_score = 5.0 OR p.performance_score<3.5
GROUP BY d.department_name
ORDER BY employee_count DESC
LIMIT 3;
--Question4:What is the average performance score by department?
SELECT d.department_name, ROUND(AVG(p.performance_score), 2) AS avg_performance_score
FROM employee e
JOIN performance p ON e.employee_id = p.employee_id
JOIN department d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_performance_score DESC;
--Section C: Salary Analysis
--Question 1:What is the total salary expense for the company?
SELECT COUNT(employee_id) AS no_of_employees, TO_CHAR(SUM(salary_amount):: numeric, 'FM£999,999,999.00')
AS total_salary_expense
FROM salary;

--Question2:What is the average salary by job title? 
SELECT e.job_title, ROUND(AVG(s.salary_amount), 2) AS avg_salary
FROM employee e
LEFT JOIN salary s ON s.employee_id = e.employee_id
GROUP BY job_title
ORDER BY avg_salary DESC
--Question11: How many employees earn above 80,000?  
SELECT COUNT(DISTINCT s.employee_id) AS high_earners
FROM salary s
WHERE s.salary_amount > 80000;

--Question 3:How does performance correlate with salary across departments??\
SELECT 
    d.department_name,
	ROUND(AVG(p.performance_score),2) AS avg_perf_score,
	ROUND(AVG(s.salary_amount),2) AS avg_salary,
	ROUND(CORR(s.salary_amount,p.performance_score)::numeric,2)
	AS perf_salary_correllation
FROM employee e
JOIN performance p ON e.employee_id = p.employee_id
JOIN salary s ON e.employee_id = s.employee_id
JOIN department d ON e.department_id = d.department_id
GROUP BY d.department_name;
