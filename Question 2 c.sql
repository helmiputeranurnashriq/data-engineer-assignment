SELECT customers.name
FROM 
customers
LEFT JOIN invoices ON customers.id = invoices.customer_id
LEFT JOIN invoice_lines ON invoices.id = invoice_lines.invoice_id
WHERE invoice_lines.id IS NULL
GROUP BY customers.name;

-- OUTPUT: CUSTOMERS WHO HAS NEVER BOUGHT BOOK ARE Faiz Ma and Isham Rais
