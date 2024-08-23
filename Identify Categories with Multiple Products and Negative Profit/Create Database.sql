-- Create the product_performance table
CREATE TABLE product_performance (
    categoryid INT,
    productid INT,
    pnl DECIMAL(10, 2),
    date DATE
);

-- Insert sample data
INSERT INTO product_performance (categoryid, productid, pnl, date)
VALUES
(1, 101, 500.00, '2024-08-01'),
(1, 102, -200.00, '2024-08-02'),
(1, 103, 150.00, '2024-08-03'),
(2, 201, 300.00, '2024-08-01'),
(2, 202, 400.00, '2024-08-02'),
(3, 301, -100.00, '2024-08-01'),
(3, 302, 250.00, '2024-08-03'),
(3, 303, 50.00, '2024-08-04'),
(4, 401, 600.00, '2024-08-01');

