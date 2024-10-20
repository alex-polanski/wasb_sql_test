USE memory.default;

CREATE TABLE SUPPLIER (
    supplier_id TINYINT,
    name VARCHAR
);

CREATE TABLE INVOICE (
    supplier_id TINYINT,
    invoice_amount DECIMAL(8, 2),
    due_date DATE
);

-- Create a table with supplier_id and name for each supplier sorted alphabetically
INSERT INTO SUPPLIER (supplier_id, name) VALUES
(1,  'Catering Plus'),
(2,  'Dave''s Discos'),
(3,  'Entertainment tonight'),
(4,  'Ice Ice Baby'),
(5,  'Party Animals');

-- Insert data from receipts using Trino's built-in function for the last day of month calculation
INSERT INTO INVOICE (supplier_id, invoice_amount, due_date) VALUES
(1, 2000.00, last_day_of_month(date_add('month', 2, CURRENT_DATE))),
(1, 1500.00, last_day_of_month(date_add('month', 3, CURRENT_DATE))),
(2, 500.00, last_day_of_month(date_add('month', 1, CURRENT_DATE))),
(3, 6000.00, last_day_of_month(date_add('month', 3, CURRENT_DATE))),
(4, 4000.00, last_day_of_month(date_add('month', 6, CURRENT_DATE))),
(5, 6000.00, last_day_of_month(date_add('month', 3, CURRENT_DATE)));
