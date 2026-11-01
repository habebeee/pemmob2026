**PERHATIAN:** Jalankan `sh setup_macos.sh` atau `flutter create --platforms=android,ios --project-name voltfix_mobile .` sebelum menekan tombol Run. Detail ada di `PERBAIKAN_ERROR.md`.

# Voltfix Mobile (Flutter)

Konversi empat desain dari ekspor Google Stitch menjadi **UI Flutter asli (widget Dart)**, ditambah layar autentikasi dan dashboard sederhana untuk empat peran. Screenshots Stitch disertakan dalam `assets/stitch_reference/` untuk perbandingan. **Tidak memakai WebView.**

## Penting: status proyek

- ✅ UI Flutter untuk: Beranda Pelanggan, Form Tiket bertahap, Detail/Pelacakan Tiket, Detail Tugas Teknisi.
- ✅ Navigasi, login demo empat role, registrasi demo, reset password placeholder, dashboard admin/manager, tiket lokal.
- ⚠️ **UI masih prototipe offline**; login demo menerima password apa pun, bukan autentikasi sungguhan.
- ⚠️ Tidak terhubung ke Laravel, database, Fonnte, push, email, kamera/galeri, maupun Google Maps.
- ⚠️ Tidak seluruh elemen HTML Stitch dikonversi pixel-perfect; teks/komponen utama diadaptasi ke Material 3, dan fitur di luar PRD (estimasi harga, reschedule, SLA 24/7, pembayaran) tidak diimplementasikan.
- ⚠️ Data lokal akan hilang saat aplikasi ditutup; jangan gunakan untuk data sungguhan atau production.

## Menjalankan di Android Studio (Mac)

1. Ekstrak ZIP, kemudian buka folder `voltfix_flutter` di Android Studio.
2. Pastikan **Flutter SDK** dan plugin Flutter/Dart sudah dipasang serta `flutter doctor` lolos pemeriksaan untuk Android.
3. Buka Terminal Android Studio pada folder proyek dan jalankan:

   ```bash
   flutter create --platforms=android,ios .
   flutter pub get
   flutter run
   ```

   `flutter create` diperlukan **sekali** untuk membangkitkan folder `android/` dan `ios/` serta kode platform sesuai SDK Flutter lokal. Kode `lib/`, `pubspec.yaml`, dan aset telah disiapkan.
4. Pilih emulator Android di Android Studio dan klik Run pada `lib/main.dart`. Untuk iOS, perlu Xcode pada macOS.

## Login demo

| Email | Dashboard | Password |
|---|---|---|
| pelanggan@demo.id | Customer | bebas (tidak kosong) |
| teknisi@demo.id | Technician | bebas (tidak kosong) |
| admin@demo.id | Admin | bebas (tidak kosong) |
| manager@demo.id | Manager | bebas (tidak kosong) |

Ini hanya pemilihan role untuk demo UI; **jangan pakai logika ini pada aplikasi production**.

## Tahap berikutnya

Tambahkan autentikasi Laravel Sanctum, API versioning `/api/v1`, Policy/RBAC server, upload foto 1–5 file, status & ticket logs via REST, dan test otomatis. Pastikan seluruh state machine dan pilihan kategori perangkat sesuai keputusan final BRD/PRD.
