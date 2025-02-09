SELECT count(*)
FROM orders o
RIGHT JOIN order_details od ON (od.order_id = o.id)
LEFT JOIN products p ON (p.id = od.product_id)
INNER JOIN suppliers sp ON (sp.id = p.supplier_id)
RIGHT JOIN categories cat ON (cat.id = p.category_id)
INNER JOIN customers c ON (c.id = o.customer_id)
RIGHT JOIN employees e ON (e.employee_id = o.employee_id)
INNER JOIN shippers s ON (s.id = o.shipper_id);
--
-- Кількість записів не змінилась, що вказує на те що для всіх записів з довідників існують замовлення, які на них посилаються
--