/***************************************
  1. List of employees including salary
****************************************/
SELECT 	
		EMP.EMP_NO, 
		EMP.LAST_NAME, 
		EMP.FIRST_NAME, 
		EMP.SEX, 
		SAL.SALARY 
FROM 
		EMPLOYEES EMP,
		SALARIES SAL
WHERE
		EMP.EMP_NO = SAL.EMP_NO

/****************************************
  2. Employees who were hired in 1986.
****************************************/
SELECT 	
		EMP.FIRST_NAME, 
		EMP.LAST_NAME, 
		EMP.HIRE_DATE
FROM 
		EMPLOYEES EMP
WHERE
		DATE_PART('year',TO_DATE(EMP.HIRE_DATE,'MM/DD/YYYY'))= '1986'

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
		MAN.EMP_NO  = EMP.EMP_NO