# Analisis Data Penjualan: SQL & Looker Studio

## Deskripsi Proyek
Proyek ini bertujuan untuk menganalisis data penjualan menggunakan SQL dan Looker Studio. Dataset yang digunakan mencakup tabel `customers`, `products`, `orders`, dan `productcategory`.

## Tabel yang Digunakan
1. **customers**
   - **Primary Key:** customerID

2. **products**
   - **Primary Key:** ProdNumber
   - **Foreign Key:** Category (merujuk ke CategoryID di tabel productcategory)

3. **orders**
   - **Primary Key:** OrderID
   - **Foreign Key:** customerID (merujuk ke customerID di tabel customers)
   - **Foreign Key:** ProdNumber (merujuk ke ProdNumber di tabel products)

4. **productcategory**
   - **Primary Key:** CategoryID

## Relationship Antar Tabel
1. **customers** ke **orders**: One to many
   - Satu pelanggan dapat memiliki banyak pesanan.

2. **products** ke **orders**: One to many
   - Satu jenis produk dapat berada pada banyak pesanan.

3. **productcategory** ke **products**: One to many
   - Satu kategori produk dapat memiliki banyak jenis produk.

## Entity Relationship Diagram (ERD)
Lihat file `ERD.jpg` untuk visualisasi hubungan antar tabel.

## Query Utama
Query ini digunakan untuk mengambil data penjualan yang mencakup informasi mengenai tanggal order, kategori produk, nama produk, harga produk, kuantitas order, total penjualan, email pelanggan, dan kota pelanggan.

```sql
SELECT
   o.Date AS order_date,
   pc.CategoryName AS category_name,
   p.ProdName AS product_name,
   p.Price AS product_price,
   o.Quantity AS order_qty,
   (p.Price * o.Quantity) AS total_sales,
   c.CustomerEmail AS cust_email,
   c.CustomerCity AS cust_city
FROM
   `bank_muamalat.customers` c
JOIN
   `bank_muamalat.orders` o ON c.customerID = o.customerID
JOIN
   `bank_muamalat.products` p ON o.ProdNumber = p.ProdNumber
JOIN
   `bank_muamalat.productcategory` pc ON p.Category = pc.CategoryID
ORDER BY
   1,
   5,
   2;
