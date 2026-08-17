use olist_project; 
-- Query 1: Average review score by delivery status
SELECT 
    CASE 
        WHEN orders.order_delivered_customer_date > orders.order_estimated_delivery_date THEN 'Late'
        WHEN orders.order_delivered_customer_date <= orders.order_estimated_delivery_date THEN 'On Time or Early'
        ELSE 'Unknown'
    END AS delivery_status,
    AVG(reviews.review_score) AS avg_review_score,
    COUNT(*) AS order_count
FROM orders
JOIN reviews ON orders.order_id = reviews.order_id
GROUP BY delivery_status;

-- Query 2: Top 10 product categories by revenue
SELECT 
    pt.product_category_name_english,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    COUNT(*) AS items_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN category_translation pt ON p.product_category_name = pt.product_category_name
GROUP BY pt.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;