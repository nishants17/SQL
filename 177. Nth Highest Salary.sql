-- APPROACH 1: USING DENSE_RANK() WINDOW FUNCTION
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        SELECT MAX(SALARY)
        FROM (SELECT SALARY, DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RN
              FROM EMPLOYEE E1) AS TEMP
        WHERE TEMP.RN = @N
        
    );
END

-- APPROACH 2: USING OFFSET AND FETCH (COMPARATIVELY SLOWER)
-- DISTINCT KEYWORD IS VERY IMPORTANT HERE
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
SET @N = @N - 1
    RETURN (
        /* Write your T-SQL query statement below. */
        SELECT DISTINCT SALARY
        FROM EMPLOYEE 
        ORDER BY SALARY DESC 
        OFFSET @N ROWS 
        FETCH NEXT 1 ROW ONLY
)
        END

-- APPROACH 3: FINDING COUNT OF SALARIES GREATER THAN NTH SALARY (N-1 SALARIES WILL BE GREATER THAN NTH SALARY)
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (select distinct e1.salary 
            from Employee e1 
            where @N-1 = (select count(distinct e2.Salary) 
                          from Employee e2 
                          where e1.Salary < e2.Salary)

)
        END
