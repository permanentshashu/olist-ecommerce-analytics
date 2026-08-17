# Project Insights Log — Olist E-Commerce Analysis

## Delivery Delay Analysis
- Olist orders are delivered 12 days early on average (mean delay = -12 days)
- 75% of orders arrive at least 7 days before the estimated date
- Worst case: one order arrived 188 days late — likely an outlier/operational failure
- 3,421 orders (2.9%) have no delivery date, likely cancelled/lost orders — needs separate investigation
## Delivery Category Breakdown
- 89.5% of orders (106,654) arrived early
- 6.3% of orders (7,559) arrived late
- 1.3% of orders (1,509) arrived exactly on time
- 2.9% of orders (3,421) have no delivery date recorded (likely cancelled/lost)

## Delivery Delay vs Review Score
- Early deliveries average 4.21★ review score
- On-time deliveries average 3.99★
- Late deliveries average 2.25★ — a drop of ~2 points compared to early deliveries
- Orders with no delivery date (likely cancelled/lost) average just 1.75★
- Conclusion: delivery delay is strongly associated with poor customer satisfaction — a key business risk area for Olist 

## Late Delivery % by State
- Worst states: Alagoas (AL) 20.5%, Maranhão (MA) 17.2%, Sergipe (SE) 15.1%
- Best states: Amazonas (AM) 2.9%, Acre (AC) 3.2%, Rondônia (RO) 3.8%
- São Paulo (SP), the largest commercial hub, has a low late rate (4.2%)
- Pattern: North/Northeast states show significantly higher late delivery rates than Southeast states — likely due to distance from major logistics hubs
- Business implication: Olist could prioritize improving delivery infrastructure/carrier partnerships in high-delay Northeast regions

## Top Revenue-Generating Categories
1. Health & Beauty — R$1.30M
2. Watches & Gifts — R$1.25M
3. Bed, Bath & Table — R$1.11M
4. Sports & Leisure — R$1.03M
5. Computers & Accessories — R$0.95M
- Health & Beauty and Watches/Gifts together account for a large share of top-line revenue, ahead of traditional big-ticket categories like electronics

## Payment Type Analysis
- Credit card is dominant: 73% of orders (87,776), avg value R$179.72, avg review 4.02
- Boleto is the 2nd most common (23,190 orders), similar avg value and review to credit card
- Voucher orders have notably lower value (R$67.43) — likely used for smaller/promotional purchases
- Debit card users show the highest satisfaction (4.15) despite lower order value, though sample size is small (1,706 orders) — not a strong conclusion
- 'not_defined' payment type (3 orders, R$0 value) is a data quality anomaly, not a meaningful pattern
