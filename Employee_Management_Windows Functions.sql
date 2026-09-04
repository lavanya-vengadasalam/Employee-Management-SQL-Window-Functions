Create Database employee_management_window_functions;
Create Table employee (employee_id INT Primary Key, employee_name VARCHAR(50),department_id INT,salary NUMERIC(10,2), 
hire_date DATE, city VARCHAR(50));
Insert Into employee Values 
(101,'Arun',10,50000,'2021-01-15','Chennai'),
(102,'Priya',20,60000,'2020-03-10','Bangalore'),
(103,'Karthik',10,55000,'2022-06-20','Chennai'),
(104,'Divya',30,70000,'2019-08-05','Mumbai'),
(105,'Rahul',20,65000,'2021-11-12','Bangalore'),
(106,'Sneha',40,45000,'2023-02-14','Delhi'),
(107,'Vijay',30,75000,'2020-09-18','Mumbai'),
(108,'Meena',40,48000,'2022-04-25','Delhi'),
(109,'Suresh',50,80000,'2018-12-10','Hyderabad'),
(110,'Anitha',10,52000,'2023-07-19','Chennai');
Select * From Employee;
Create Table former_employees (employee_id INT Primary Key, employee_name VARCHAR(50), department_id INT, salary NUMERIC(10,2),
city VARCHAR(50));
Insert Into former_employees Values 
(201,'Arun',10,48000,'Chennai'),
(202,'Priya',20,55000,'Bangalore'),
(203,'Manoj',30,60000,'Mumbai'),
(204,'Divya',30,65000,'Mumbai'),
(205,'Ravi',40,42000,'Delhi'),
(206,'Kavya',50,70000,'Hyderabad'),
(207,'Suresh',50,75000,'Hyderabad'),
(208,'Anu',60,45000,'Pune'),
(209,'Karthik',10,50000,'Chennai'),
(210,'Meena',40,44000,'Delhi');
Select * From Former_Employees;
Select city From employee Union All Select city From former_employees;
Select city From employee Union Select city From former_employees;
Select employee_name From employee Union Select employee_name From former_employees;
Select employee_name From employee Intersect Select employee_name From former_employees;
Select employee_name From employee Except Select employee_name From former_employees;
Select employee_name From former_employees Except Select employee_name From employee;
Select employee_name,city From employee Intersect Select employee_name,city FromFrom former_employees;
Select department_id From employee Intersect Select department_id From former_employees;
Select department_id From employee Except Select department_id From former_employees;
Select employee_name,'Current' AS employee_status From employee Union All Select employee_name,'Former' AS employee_status 
From former_employees;
Select employee_id,employee_name,department_id,salary,ROW_NUMBER() Over(Partition By department_id
Order By employee_id) AS row_num From employee;
Select employee_id,employee_name,salary,RANK() Over(Order By salary DESC) AS salary_rank From employee;
Select * From (Select employee_id,employee_name,salary,DENSE_RANK() Over(Order By salary DESC) AS salary_rank From employee) x Where 
salary_rank <= 3;
Select * From (Select employee_id,employee_name,department_id,salary,RANK() Over(Partition By department_id
Order By salary DESC) AS rnk From employee) x WHERE rnk=1;
Select * From (Select employee_id,employee_name,department_id,salary,DENSE_RANK() Over(Partition By department_id 
Order By salary DESC) AS rnk From employee) x WHERE rnk=2;
Select SUM(salary) AS total_salary From employee;
Select employee_name,department_id,salary,SUM(salary) Over(Partition By department_id) AS department_total_salary From employee;
Select employee_name,department_id,salary,AVG(salary) Over(Partition By department_id) AS department_average_salary From employee;
Select employee_name,department_id,salary,AVG(salary) Over(Partition By department_id) AS department_average,salary-AVG(salary)
Over(Partition By department_id) AS difference From employee;
Select employee_name,department_id,salary,MIN(salary) Over(Partition By department_id) AS minimum_salary From employee;
Select employee_name,department_id,salary,MAX(salary) Over(Partition By department_id) AS maximum_salary From employee;
Select employee_name,department_id,COUNT(*) Over(Partition By department_id) AS employee_count FromFrom employee;
Select employee_id,employee_name,salary,SUM(salary) OverOver(Order By employee_id) AS running_salary_total From employee;
Select employee_id,employee_name,salary,LAG(salary) Over(Order By employee_id) AS previous_salary From employee;
Select employee_id,employee_name,salary,LAG(salary) Over(Order By employee_id) AS previous_salary,salary-LAG(salary) 
Over(Order By employee_id) AS salary_difference From employee;
Select employee_id,employee_name,salary,LEAD(salary) Over(Order By employee_id) AS next_salary From employee;
Select employee_id,employee_name,department_id,salary,FIRST_VALUE(salary) Over(Partition By department_id Order By salary DESC)
AS first_salary From employee;
Select employee_id, employee_name, department_id, salary, LAST_VALUE(salary) 
Over(Partition By department_id Order By salary DESC) AS last_salary From employee;








