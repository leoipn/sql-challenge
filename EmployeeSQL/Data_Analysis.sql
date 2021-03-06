/***************************************
  1. List of employees including salary
****************************************/
SELECT 	
		EMP.EMP_NO AS "Employee number", 
		EMP.LAST_NAME AS "Last name", 
		EMP.FIRST_NAME AS "First name", 
		EMP.SEX AS "Sex", 
		SAL.SALARY AS "Salary" 
FROM 
		EMPLOYEES EMP,
		SALARIES SAL
WHERE
		EMP.EMP_NO = SAL.EMP_NO;

/****************************************
  2. Employees who were hired in 1986.
****************************************/
SELECT 	
		EMP.FIRST_NAME AS "First name", 
		EMP.LAST_NAME AS "Last name", 
		EMP.HIRE_DATE AS "Hire date"
FROM 
		EMPLOYEES EMP
WHERE
		DATE_PART('year',TO_DATE(EMP.HIRE_DATE,'MM/DD/YYYY'))= '1986';

/****************************************
  3. Manager of each department.
****************************************/
SELECT 	DEP.DEPT_NO AS "Department Number",
		DEP.DEPT_NAME AS "Department Name",
		MAN.EMP_NO AS "Employee Number",
		EMP.LAST_NAME AS "Last name",
		EMP.FIRST_NAME AS "First name"
FROM 
		DEPT_MANAGER MAN,
		DEPARTMENTS DEP,
		EMPLOYEES EMP
WHERE
		MAN.DEPT_NO = DEP.DEPT_NO AND
		MAN.EMP_NO  = EMP.EMP_NO;

/****************************************
  4. Deparment of each employee.
****************************************/
SELECT 	DEMP.EMP_NO AS "Employee Number",
		EMP.LAST_NAME AS "Last name",
		EMP.FIRST_NAME AS "First name",
		DEP.DEPT_NAME AS "Department Name"		
FROM 
		DEPT_EMP DEMP,
		DEPARTMENTS DEP,
		EMPLOYEES EMP
WHERE
		DEMP.DEPT_NO = DEP.DEPT_NO AND
		DEMP.EMP_NO  = EMP.EMP_NO;

/******************************************************************************
  5. Employees whose first name is "Hercules" and last names begin with "B."
*******************************************************************************/
SELECT 	EMP.FIRST_NAME AS "First name",
		EMP.LAST_NAME AS "Last name",
		EMP.SEX AS "SEX"
FROM 	
		EMPLOYEES EMP
WHERE
		EMP.FIRST_NAME = 'Hercules' AND
		EMP.LAST_NAME LIKE 'B%';

/****************************************
  6. All employees in the Sales department.
****************************************/
SELECT 	EMP.EMP_NO AS "Employee number",
		EMP.LAST_NAME AS "Last name",
		EMP.FIRST_NAME AS "First name",
		DEP.DEPT_NAME AS "Department name"
FROM 	
		EMPLOYEES EMP,
		DEPT_EMP DEMP,
		DEPARTMENTS DEP
WHERE
		EMP.EMP_NO   = DEMP.EMP_NO AND
		DEMP.DEPT_NO = DEP.DEPT_NO AND
		DEP.DEPT_NAME = 'Sales'

UNION ALL

SELECT 	EMP.EMP_NO AS "Employee number",
		EMP.LAST_NAME AS "Last name",
		EMP.FIRST_NAME AS "First name",
		DEP.DEPT_NAME AS "Department name"
FROM 	
		EMPLOYEES EMP,
		DEPT_MANAGER MAN,
		DEPARTMENTS DEP
WHERE
		EMP.EMP_NO   = MAN.EMP_NO AND
		MAN.DEPT_NO = DEP.DEPT_NO AND
		DEP.DEPT_NAME = 'Sales';

/***********************************************************
  7. Employees in the Sales and Development departments.
************************************************************/
SELECT 	EMP.EMP_NO AS "Employee number",
		EMP.LAST_NAME AS "Last name",
		EMP.FIRST_NAME AS "First name",
		DEP.DEPT_NAME AS "Department name"
FROM 	
		EMPLOYEES EMP,
		DEPT_EMP DEMP,
		DEPARTMENTS DEP
WHERE
		EMP.EMP_NO   = DEMP.EMP_NO AND
		DEMP.DEPT_NO = DEP.DEPT_NO AND
		DEP.DEPT_NAME IN ('Sales','Development')

UNION ALL

SELECT 	EMP.EMP_NO AS "Employee number",
		EMP.LAST_NAME AS "Last name",
		EMP.FIRST_NAME AS "First name",
		DEP.DEPT_NAME AS "Department name"
FROM 	
		EMPLOYEES EMP,
		DEPT_MANAGER MAN,
		DEPARTMENTS DEP
WHERE
		EMP.EMP_NO   = MAN.EMP_NO AND
		MAN.DEPT_NO = DEP.DEPT_NO AND
		DEP.DEPT_NAME IN ('Sales','Development');

/*********************************************
  8. Frequency count of employee last names.
**********************************************/
SELECT	EMP.LAST_NAME AS "Last name",
		COUNT(LAST_NAME) AS "Total"
FROM
		EMPLOYEES EMP
GROUP BY EMP.LAST_NAME
ORDER BY "Total" DESC;