USE memory.default;

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    SUM(exp.unit_price * exp.quantity) AS total_expensed_amount
FROM
    EMPLOYEE e
JOIN
    EXPENSE exp ON e.employee_id = exp.employee_id
LEFT JOIN
    EMPLOYEE m ON e.manager_id = m.employee_id
GROUP BY
    e.employee_id, e.first_name, e.last_name, e.manager_id, m.first_name, m.last_name
HAVING
    SUM(exp.unit_price * exp.quantity) > 1000
ORDER BY
    total_expensed_amount DESC;
