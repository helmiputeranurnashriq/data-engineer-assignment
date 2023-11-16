SELECT invoice_lines.sku_id, invoice_lines.description, customers.name
FROM 
customers
LEFT JOIN invoices ON customers.id = invoices.customer_id
LEFT JOIN invoice_lines ON invoices.id = invoice_lines.invoice_id
WHERE invoices.id IS NOT NULL;

-- OUTPUT
-- # sku_id	description	name
-- 1	Book #1	Irfan Bakti
-- 3	Book #3	Jack Smmith
-- 2	Book #2	Jack Smmith
-- 1	Book #4	Jack Smmith
-- 2	Book #6	Nazir
-- 1	Book #5	Nazir
-- 3	Book #8	Shanon Teoh
-- 1	Book #7	Shanon Teoh


