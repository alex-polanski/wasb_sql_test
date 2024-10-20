USE memory.default;

WITH RECURSIVE ManagerLoop(employee_id, manager_id, path, cycle) AS (
    -- Base case: start with each employee
    SELECT
        employee_id,
        manager_id,
        ARRAY[employee_id] AS path,  -- Initialize the path without CAST
        false AS cycle
    FROM
        EMPLOYEE

    UNION ALL

    -- Recursive case: traverse the hierarchy
    SELECT
        e.employee_id,
        e.manager_id,
        path || e.employee_id,  -- Append the employee_id to the path
        contains(path, e.employee_id) AS cycle  -- Check if we've encountered a cycle using contains()
    FROM
        EMPLOYEE e
    JOIN
        ManagerLoop m ON e.manager_id = m.employee_id  -- This part connects the current employee (e.employee_id) with their manager.
    WHERE
        NOT m.cycle  -- Continue only if no cycle yet
)
-- Select where cycles exist
SELECT employee_id, path
FROM ManagerLoop
WHERE cycle;
