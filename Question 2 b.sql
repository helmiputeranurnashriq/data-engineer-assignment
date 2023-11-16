-- NONE OF CUSTOMER BUY MORE THAN 5 BOOKS
SELECT customers.name, count(*) as number_of_customers
FROM 
customers
LEFT JOIN invoices ON customers.id = invoices.customer_id
LEFT JOIN invoice_lines ON invoices.id = invoice_lines.invoice_id
WHERE invoice_lines.id IS NOT NULL
GROUP BY customers.name
HAVING number_of_customers > 5;

