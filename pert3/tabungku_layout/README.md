# TabungKu — Ringkasan Tabungan

**Mata Kuliah:** TI505 Pemrograman Mobile  
**Tugas:** Minggu 3 — Menyusun Layout dengan Widget Dasar Flutter  
**Nama:** Habiburrahman  
**NIM:** 20240801149

## Deskripsi

**TabungKu** adalah aplikasi Flutter sederhana yang menampilkan halaman **Ringkasan Tabungan** menggunakan widget dasar Flutter. Proyek ini dibuat untuk memenuhi tugas Pertemuan 3 tentang penyusunan layout.

Halaman aplikasi terdiri atas:

1. **Kartu ringkasan tabungan** yang memuat nama tabungan, saldo, dan target.
2. **Tiga kategori**: Menabung, Tarik, dan Riwayat.
3. **Daftar riwayat transaksi** berisi minimal tiga transaksi dengan judul, tanggal, dan nominal.

Data yang digunakan bersifat **statis (*hard-coded*)**. Ikon kategori merupakan elemen tampilan dan belum menjalankan transaksi atau navigasi. Proyek ini tidak memerlukan database, API, atau paket state management tambahan.

## Teknologi dan Widget

- Flutter dan Dart
- Material Widgets bawaan Flutter, tanpa paket pihak ketiga tambahan
- `MaterialApp`, `Scaffold`, dan `AppBar`
- `Column`, `Row`, `Container`, `Padding`, serta `SizedBox`
- `Expanded`, `Flexible`, dan `ConstrainedBox` untuk penataan ruang
- `SingleChildScrollView` untuk mengakomodasi tinggi layar yang terbatas

## Cara Menjalankan

1. Buka folder **`pert3/tabungku_layout`** di Android Studio.
2. Pastikan Flutter SDK terpasang dan emulator Android sudah menyala.
3. Jalankan perintah berikut melalui Terminal pada folder proyek:

   ```bash
   flutter pub get
   flutter run
   ```

4. Jika terdapat lebih dari satu perangkat, periksa dengan `flutter devices`, lalu jalankan `flutter run -d <ID_PERANGKAT>` menggunakan ID yang ditampilkan.

## Validasi Kode

Jalankan:

```bash
flutter analyze
flutter test
```

Pemeriksaan responsivitas tetap perlu dilakukan secara visual pada emulator ponsel portrait dan tablet. Pastikan halaman tidak mengalami *overflow*.

## Struktur Proyek

```text
tabungku_layout/
├── android/
├── docs/
│   ├── README.md
│   ├── screenshot_mobile.png
│   └── screenshot_tablet.png
├── ios/
├── lib/
│   └── main.dart
├── linux/
├── macos/
├── test/
│   └── widget_test.dart
├── web/
├── windows/
├── .gitignore
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

> Folder `build/` dan berkas IDE lokal tidak perlu diunggah ke GitHub karena merupakan berkas hasil build atau konfigurasi lingkungan pengembangan.

## Dokumentasi Tampilan

Dua screenshot asli aplikasi disimpan di folder [`docs/`](docs/):

### 1. Tampilan Mobile (Portrait)

![Screenshot aplikasi TabungKu pada ponsel](docs/screenshot_mobile.png)

### 2. Tampilan Tablet

![Screenshot aplikasi TabungKu pada tablet](docs/screenshot_tablet.png)

Kedua screenshot harus berasal dari aplikasi Flutter yang benar-benar dijalankan, bukan dari mockup atau gambar yang diedit. Pastikan isi halaman dan tidak adanya indikator *overflow* terlihat jelas.

## Catatan Responsivitas

- `SingleChildScrollView` memungkinkan konten digulir pada layar dengan tinggi terbatas.
- `ConstrainedBox(maxWidth: 650)` membatasi lebar konten agar tetap nyaman dibaca pada tablet.
- `Expanded` dan `Flexible` membantu membagi ruang horizontal, sedangkan `TextOverflow.ellipsis` membantu menangani label kategori yang panjang.

## Pengumpulan

Proyek disimpan dalam repository GitHub publik:

**[habebeee/pemmob2026 — pert3/tabungku_layout](https://github.com/habebeee/pemmob2026/tree/main/pert3/tabungku_layout)**

Pengumpulan dilakukan melalui LMS dengan mencantumkan tautan repository publik, termasuk kode sumber, `README.md`, dan dua screenshot pengujian di folder `docs/`.

---

**Dibuat oleh Habiburrahman — 20240801149**
