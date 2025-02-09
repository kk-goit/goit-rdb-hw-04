SELECT count(*)
FROM orders o
INNER JOIN order_details od ON (od.order_id = o.id)
INNER JOIN products p ON (p.id = od.product_id)
INNER JOIN suppliers sp ON (sp.id = p.supplier_id)
INNER JOIN categories cat ON (cat.id = p.category_id)
INNER JOIN customers c ON (c.id = o.customer_id)
INNER JOIN employees e ON (e.employee_id = o.employee_id)
INNER JOIN shippers s ON (s.id = o.shipper_id)
WHERE e.employee_id > 3 AND e.employee_id <= 10;