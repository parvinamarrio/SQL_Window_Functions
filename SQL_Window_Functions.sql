USE hr;

SELECT first_name,salary
FROM employees
ORDER BY salary ASC;

SELECT first_name,salary
FROM employees
ORDER BY salary DESC;

SELECT first_name,salary
FROM employees
ORDER BY salary;

SELECT first_name,salary,RANK() OVER(ORDER BY salary DESC) AS RNK
FROM employees;

SELECT first_name,salary,DENSE_RANK() OVER(ORDER BY salary DESC) AS RNK
FROM employees;

SELECT first_name,salary,ROW_NUMBER() OVER(ORDER BY salary DESC) AS RNK
FROM employees;

SELECT first_name,salary,department_id,RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS RNK
FROM employees;

SELECT first_name,salary,LEAD(salary) OVER(ORDER BY employee_id) AS id
FROM employees;

SELECT first_name,salary,LEAD(salary,2) OVER(ORDER BY employee_id) AS id
FROM employees;

SELECT first_name,salary,LEAD(salary,3) OVER(ORDER BY employee_id) AS id
FROM employees;

SELECT first_name,salary,LEAD(salary,3,9000) OVER(ORDER BY employee_id) AS id
FROM employees;

SELECT department_id,SUM(salary) AS tot_sal
FROM employees
GROUP BY 1;

SELECT first_name,department_id,salary,SUM(salary) OVER() AS tot_sal
FROM employees;

SELECT first_name,department_id,SUM(salary) OVER(PARTITION BY department_id) AS tot_sal
FROM employees;

SELECT 
first_name,
department_id,
salary,
SUM(salary) OVER(PARTITION BY department_id ORDER BY employee_id) AS tot_sal
FROM employees;

SELECT first_name,salary,LAG(salary) OVER(ORDER BY employee_id) AS id
FROM employees;

SELECT first_name,salary,LAG(salary,2) OVER(ORDER BY employee_id) AS id
FROM employees;