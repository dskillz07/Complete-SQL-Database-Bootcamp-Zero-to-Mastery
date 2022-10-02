/* TRY TO WRITE THESE AS JOINS FIRST */
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/

-- Using JOINS

select customerid,
    firstname,
    lastname,
    state
from orders
Join customers c
    using (customerid)
WHERE state IN ('NY', 'OH', 'OR')
ORDER BY orderid

-- Using Subquery 
select c.customerid,
    c.firstname,
    c.lastname,
    c.state
from orders o,
      ( select *
    from customers
       ) AS c
WHERE state IN ('NY', 'OH', 'OR')
ORDER BY orderid

/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/

--Using JOINS

SELECT e.emp_no, dm.emp_no, first_name, last_name
from employees e
Join  dept_emp de
    using (emp_no)
join dept_manager dm 
    using (dept_no)
where dm.emp_no = 110183

--Using Subqueries
SELECT e.emp_no, first_name, last_name
from employees e
    where emp_no in 
        (SELECT emp_no
         from dept_emp de
         where dept_no = (
               select dept_no
               from dept_manager
               where emp_no =110183
            )
)

