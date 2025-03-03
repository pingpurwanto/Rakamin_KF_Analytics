
--Join Table
SELECT
  ft.transaction_id,
  ft.date,
  ft.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,
  ft.customer_name,
  prod.product_id,
  prod.product_name,
  ft.price AS actual_price,
  ft.discount_percentage,
  ft.rating AS rating_transaksi
FROM `kimia_farma.kf_final_transaction` ft
LEFT JOIN `kimia_farma.kf_kantor_cabang` kc ON ft.branch_id = kc.branch_id
LEFT JOIN `kimia_farma.kf_product` prod ON ft.product_id = prod.product_id
LEFT JOIN `kimia_farma.kf_inventory` inv ON prod.product_id = inv.product_id;

SELECT kfa.*, ki.Inventory_ID, ki.opname_stock
FROM `kimia_farma.kf_analysis` kfa
LEFT JOIN `kimia_farma.kf_inventory` ki ON kfa.branch_id = ki.branch_id;


--Update Kolom2 yang dibutuhkan:
--Tambah persentase_gross_laba
ALTER TABLE kimia_farma.kf_analysis ADD COLUMN persentase_gross_laba FLOAT64;

UPDATE kimia_farma.kf_analysis
SET persentase_gross_laba = 
    CASE 
        WHEN actual_price <= 50000 THEN 0.1
        WHEN actual_price > 50000 AND actual_price <= 100000 THEN 0.15
        WHEN actual_price > 100000 AND actual_price <= 300000 THEN 0.2
        WHEN actual_price > 300000 AND actual_price <= 500000 THEN 0.25
        WHEN actual_price > 500000 THEN 0.3
    END
  WHERE actual_price IS NOT NULL;

--Tambah nett_profit
ALTER TABLE kimia_farma.kf_analysis ADD COLUMN nett_profit FLOAT64;

UPDATE kimia_farma.kf_analysis
SET nett_profit = (persentase_gross_laba-discount_percentage) * actual_price
WHERE actual_price IS NOT NULL;

--Tambah nett_sales
ALTER TABLE kimia_farma.kf_analysis ADD COLUMN nett_sales FLOAT64;

UPDATE kimia_farma.kf_analysis
SET nett_sales = actual_price*(1-discount_percentage)
WHERE actual_price IS NOT NULL;


--EDA singkat
--Missing Values
 SELECT 
    COUNTIF(transaction_id IS NULL) AS missing_transaction_id,
    COUNTIF(date IS NULL) AS missing_date,
    COUNTIF(branch_id IS NULL) AS missing_branch_id,
    COUNTIF(branch_name IS NULL) AS missing_branch_name,
    COUNTIF(kota IS NULL) AS missing_kota,
    COUNTIF(provinsi IS NULL) AS missing_provinsi,
    COUNTIF(rating_cabang IS NULL) AS missing_rating_cabang,
    COUNTIF(customer_name IS NULL) AS missing_customer_name,
    COUNTIF(product_id IS NULL) AS missing_product_id,
    COUNTIF(product_name IS NULL) AS missing_product_name,
    COUNTIF(actual_price IS NULL) AS missing_actual_price,
    COUNTIF(discount_percentage IS NULL) AS missing_discount_percentage,
    COUNTIF(rating_transaksi IS NULL) AS missing_rating_transaksi,
    COUNTIF(persentase_gross_laba IS NULL) AS missing_persentase_gross_laba,
    COUNTIF(nett_sales IS NULL) AS missing_nett_sales,
    COUNTIF(nett_profit IS NULL) AS missing_nett_profit
FROM `kimia_farma.kf_analysis`;

-- lihat sekilas data
select * from kimia_farma.kf_analysis limit 5;
--ditemukan nett_profit negatif

-- check berapa harga yang diskon 15% tapi di bawah presentase laba 15% --> tidak ada untung? --> 15 produk harganya di bawah 100 ribu (laba 10-15%) 
select distinct product_id, actual_price from kimia_farma.kf_analysis where discount_percentage=0.15 and actual_price <=100000;

-- berapa jumlah produk?  --> 50 produk
select product_id, count(product_id) from kimia_farma.kf_analysis
group by product_id;

with kfa as (
  select *
  from kimia_farma.kf_analysis
)

--contoh produk yang dijual merugi
select
  product_id,
  kfa.persentase_gross_laba,
  kfa.discount_percentage,
  kfa.nett_profit
from kfa
where actual_price<=100000
limit 5;

--making sense of the negative profit for some upper data sample.
select '<=100 ribu' harga, avg(nett_sales) as nett_sales, avg(nett_profit) as nett_profit, count(DISTINCT product_id) as jumlahproduk
from kfa
where actual_price <=100000
union all
select '>100 ribu' harga, avg(nett_sales) as nett_sales, avg(nett_profit) as nett_profit, count(DISTINCT product_id) as jumlahproduk
from kfa
where actual_price >100000
union all
select 'semua'harga , avg(nett_sales) as nett_sales, avg(nett_profit) as nett_profit, count(DISTINCT product_id) as jumlahproduk
from kfa;

--melihat daftar provinsi
select distinct kfa.provinsi
from kfa


