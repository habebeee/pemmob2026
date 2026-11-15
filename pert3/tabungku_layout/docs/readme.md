# Dokumentasi screenshot TabungKu

Rubrik dosen meminta **dua screenshot ASLI hasil pengujian pada ukuran layar berbeda**. Jangan menggunakan mockup, screenshot desain, atau gambar buatan sebagai bukti runtime.

## Cara termudah melalui Android Studio

1. Jalankan aplikasi pada emulator **ponsel portrait** sampai halaman `Ringkasan Tabungan` muncul.
2. Klik ikon **Take Screenshot** di toolbar emulator dan simpan sebagai `docs/screenshot_mobile.png`.
3. Buka **Tools > Device Manager > Create Device**, pilih profil **Tablet** (misalnya Pixel Tablet), lalu jalankan aplikasi pada emulator tersebut.
4. Simpan screenshot tablet sebagai `docs/screenshot_tablet.png`.
5. Buka kedua PNG untuk memeriksa apakah halaman benar-benar terlihat dan tidak terdapat strip overflow kuning-hitam.

## Cara terpandu lewat PowerShell

Dari root proyek pada Terminal Android Studio, jalankan:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ".\tools\validate-and-capture.ps1"
```

Skrip melakukan `flutter pub get`, `flutter analyze`, dan `flutter test`; kemudian memandu pemilihan emulator serta mengambil screenshot menggunakan ADB. Emulator dan aplikasi harus dijalankan sendiri di Android Studio sebelum tiap screenshot. Jika ada dua emulator aktif bersamaan, skrip menanyakan perangkat mana yang akan digunakan.

Perhatikan bahwa keberhasilan skrip **tidak membuktikan konten gambar sudah benar**: tetap periksa hasil PNG secara visual.

## Yang harus terlihat

- Tampilan aplikasi TabungKu, bukan home screen emulator.
- Halaman `Ringkasan Tabungan`, kartu saldo/target, menu kategori, dan transaksi (bila perlu scroll pada ponsel).
- Tidak ada indikator overflow atau error Flutter.
- Screenshot diambil dari dua ukuran layar yang berbeda.

## Output yang diwajibkan

```text
docs/
├── README.md
├── screenshot_mobile.png
└── screenshot_tablet.png
```
