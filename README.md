# 📊 Kimia Farma - Big Data Analyst Project

Proyek ini dibuat sebagai bagian dari program Project-Based Internship di Kimia Farma bekerja sama dengan Rakamin Academy, yang berfokus pada analisis kinerja bisnis dari tahun 2020 hingga 2023 menggunakan BigQuery & Google Looker Studio.

## 📁 Isi Repository
<pre>
🔹 📂 SQL Queries – Berisi query untuk mengolah dan menganalisis data di BigQuery.
🔹 📊 Dashboard – Link ke dashboard Google Looker Studio yang menampilkan insight dari analisis data.
🔹 📜 Final Report (PPT) – Dokumen laporan akhir yang menjelaskan hasil analisis.
🔹 🎥 Video Presentasi – Video penjelasan proyek yang dikumpulkan dalam final submission.
</pre>
## 📌 Link Penting
<pre>
🔗 BigQuery Query: [Query Summary](https://github.com/pingpurwanto/Rakamin_KF_Analytics/blob/main/Query%20Summary.sql)
🔗 Looker Studio: [Dashboard](https://lookerstudio.google.com/s/mDPAPyz7hpo)
🔗 Final Report: [PPT](https://docs.google.com/presentation/d/1esCvv2dCr-VBwt0gLrQ1oxlf2RASBZex/edit?usp=sharing&ouid=103968357678981377742&rtpof=true&sd=true)
🔗 Video Presentasi: [Video](https://drive.google.com/drive/folders/1VEJbuDSwJ0cFNvsyc0iz9siAWL7WKNEZ?usp=drive_link)
</pre>

## 🗂️ Dataset yang Digunakan

Dataset ini terdiri dari 4 tabel utama yang telah diimpor ke BigQuery:

    kf_final_transaction.csv 📄
        Berisi detail transaksi, termasuk ID transaksi, tanggal, harga obat, diskon, dan rating transaksi.
    kf_inventory.csv 📦
        Data stok obat di setiap cabang Kimia Farma.
    kf_kantor_cabang.csv 🏢
        Informasi lokasi cabang, kota, provinsi, dan rating cabang.
    kf_product.csv 💊
        Informasi produk obat, termasuk harga dan kategori produk.

## 🔍 Proses Analisis

### 1️⃣ Mengimpor Dataset ke BigQuery
📥 Dataset diunggah ke Google BigQuery, dan dibuat tabel analisis utama (kf_analysis) berdasarkan hasil agregasi dari keempat dataset di atas.

### 2️⃣ Membuat Tabel Analisis Utama (kf_analysis)
<pre>
SQL digunakan untuk menggabungkan data menjadi tabel analisis dengan kolom utama:
✅ transaction_id | ✅ date | ✅ branch_id | ✅ branch_name
✅ kota | ✅ provinsi | ✅ rating_cabang | ✅ customer_name
✅ product_id | ✅ product_name | ✅ actual_price | ✅ discount_percentage
✅ nett_sales (harga setelah diskon) | ✅ nett_profit (keuntungan)
✅ persentase_gross_laba | ✅ rating_transaksi
</pre>
📌 Query utama untuk membuat tabel ini dapat dilihat di file [Query Summary](https://github.com/pingpurwanto/Rakamin_KF_Analytics/blob/main/Query%20Summary.sql).

### 3️⃣ Membuat Dashboard di Looker Studio

📊 Dashboard interaktif dibuat di Google Looker Studio untuk menampilkan insight seperti:

    Perbandingan pendapatan dari tahun ke tahun 📈
    Top 10 cabang dengan transaksi & nett sales tertinggi 🏪
    Top 5 cabang dengan rating tertinggi tetapi rating transaksi terendah ⭐📉
    Geo Map untuk total profit masing-masing provinsi 🗺️

## 🛠️ Teknologi yang Digunakan
<pre>
💡 Google BigQuery – Untuk menyimpan, mengolah, dan menganalisis data.
📊 Google Looker Studio – Untuk membuat visualisasi dashboard interaktif.
📝 SQL (BigQuery Standard SQL) – Untuk melakukan agregasi dan analisis data.
</pre>
## 🚀 Cara Menggunakan
<pre>
1️⃣ Clone repository ini ke lokal Anda
  
    git clone --ISI DISINI--
  
2️⃣ Akses SQL Queries untuk menjalankan analisis di BigQuery
3️⃣ Buka link Looker Studio untuk melihat hasil dashboard
4️⃣ Lihat final report untuk penjelasan lebih detail
</pre>

## 📢 Hasil & Insight Utama

📌 (Ringkas insight utama yang ditemukan dalam analisis, misalnya tren pendapatan, cabang terbaik, produk terlaris, dll.)

###📌 1. Diskon Berlebih pada Produk Murah Menyebabkan Kerugian
<pre>
✅ Temuan:
Produk dengan harga di bawah Rp100.000 sering diberikan diskon lebih besar dibanding margin labanya.
Hal ini menyebabkan beberapa transaksi justru merugikan perusahaan.
Solusi:
Meninjau ulang kebijakan diskon untuk produk murah.
Mengoptimalkan strategi harga agar tetap kompetitif tanpa mengurangi profitabilitas.
</pre>
###📌 2. Produk dengan Harga Tinggi Menjadi Penopang Keuntungan
<pre>
✅ Temuan:
Produk dengan harga di atas Rp100.000 memiliki margin keuntungan yang lebih besar.
Keuntungan dari produk ini mampu menutupi kerugian dari produk murah.
Solusi:
Meningkatkan promosi produk dengan harga tinggi.
Menganalisis apakah ada peluang untuk meningkatkan stok produk ini di cabang yang memiliki permintaan tinggi.
</pre>
###📌 3. Ketimpangan Performa Antar Cabang
<pre>
✅ Temuan:
Beberapa cabang memiliki transaksi tinggi, tetapi profit rendah.
Beberapa cabang dengan rating tinggi memiliki rating transaksi yang rendah, menunjukkan potensi masalah dalam pelayanan pelanggan atau efisiensi operasional.
Solusi:
Menganalisis cabang dengan transaksi tinggi tetapi profit rendah untuk mengidentifikasi penyebabnya (misalnya biaya operasional yang tinggi atau margin keuntungan rendah).
Mengoptimalkan strategi di cabang dengan rating transaksi rendah, misalnya melalui pelatihan staf atau peningkatan sistem layanan pelanggan.
</pre>

## 📩 Kontak & Kontribusi

Jika ada pertanyaan atau saran, silakan hubungi saya melalui pingpurwanto@gmail.com / [linked-in](https://www.linkedin.com/in/opingkanp/.)
Terima kasih telah mengunjungi repository ini! 😊🎉
