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

## SQL Verification: Delivery Status vs Review Score
- Recreated the delivery-delay-vs-review-score analysis in SQL (MySQL) to verify Python findings
- On Time/Early orders (88,658): avg review 4.29
- Late orders (7,701): avg review 2.57
- Unknown/missing delivery date (2,865): avg review 1.76
- Result confirms Python analysis: late/failed deliveries strongly correlate with lower customer satisfaction, verified independently across two tools

# Power BI Dashboard — Build Summary

## Dashboard Structure
- **Page 1 – Overview:** 4 KPI cards + Top 10 Categories by Revenue + Late Delivery Rate by State
- **Page 2 – Delivery Deep Dive:** Review Score by Delivery Status + Monthly Order Volume Trend

---

## KPI Summary Cards
- Total Revenue: R$14M
- Total Orders: 99K
- Late Delivery Rate: 7.87%
- Average Review Score: 4.09

---

## Visual 1: Top 10 Product Categories by Revenue
- Rebuilt using a Power Query merge (joined `product_category_name_translation` directly into `products` table) after live cross-table relationships proved unreliable for a 2-hop lookup
- Top 3 categories confirmed: health_beauty, watches_gifts, bed_bath_table — matches Python findings exactly
- ~610 products have no assigned category ("Blank" segment) — real data gap from source, not a build error

---

## Visual 2: Late Delivery Rate by State
- Built using a DAX calculated column (`delivery_status`) and a `Late %` measure
- Worst state: Alagoas (AL) at ~20% late — matches Python and SQL findings almost exactly
- Confirms regional delivery problem is concentrated in North/Northeast Brazil

---

## Visual 3: Average Review Score by Delivery Status
- On Time/Early orders: 4.29★ average
- Late orders: 2.57★ average
- Matches Python (4.21/2.25) and SQL (4.29/2.57) findings — third independent confirmation of this core finding

---

## Visual 4: Monthly Order Volume Trend
- Orders grew steadily from near-zero (Jan 2017) to a peak of ~8,700/month by late 2017–2018
- Sharp drop-off after mid-2018 — likely incomplete data collection at dataset's end date, not a real business decline

---

## Technical Notes (for reference/interview prep)
- Multiple columns (`price`, `review_score`, `order_purchase_timestamp`) were imported as Text by default and had to be manually converted to correct data types (Decimal, Whole Number, Date/Time) before they could be aggregated
- A live 2-hop table relationship (order_items → products → category_translation) proved unreliable in visuals; solved by merging the lookup directly into the source table via Power Query instead
- DAX measures created: `Total Revenue`, `Total Orders`, `Avg Review Score`, `Late %`

## Note: Python vs Power BI — Unknown Delivery Status Discrepancy
- Python's left-merge kept a small number of Unknown-status orders that had reviews (avg score 1.75)
- Power BI's relationship-based join excludes these same rows from the Review Score chart, showing only Late/On Time categories
- Both results are technically correct given each tool's default join behavior — a reminder that join type affects results, especially for edge cases