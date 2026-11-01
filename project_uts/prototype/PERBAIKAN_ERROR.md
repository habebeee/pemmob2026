# Voltfix Flutter — Perbaikan Error Android Studio

## Penyebab error pada screenshot

1. `AndroidManifest.xml could not be found`: ekspor terdahulu tidak memuat folder `android/` dan `ios/`. Scaffold platform harus dihasilkan dengan Flutter CLI lokal agar sesuai versi SDK yang terpasang.
2. `main.dart` mengandung satu penutup `}` berlebih pada kelas `_AdminTicketsViewState` (baris sekitar 159 pada kode lama). Sudah diperbaiki.
3. `Color.withValues` diganti menjadi `Color.withOpacity` untuk kompatibilitas dengan Flutter SDK versi lebih lama.

## Cara instalasi dengan folder ZIP revisi

1. Ekstrak ZIP revisi.
2. Buka **folder `voltfix_flutter`** (jangan buka folder parent) di Android Studio.
3. Jalankan terminal di dalam folder tersebut:

```bash
flutter --version
flutter create --platforms=android,ios --project-name voltfix_mobile .
flutter pub get
flutter analyze
flutter run
```

Atau jalankan: `sh setup_macos.sh` lalu `flutter run`.

> Folder `android/` dan `ios/` tidak ikut dibundel karena memerlukan generator resmi `flutter create` yang mengikuti versi SDK pada Mac Anda. Jalankan perintah pertama sebelum menekan Run.

Jika sebelumnya proyek `prototype` sudah dibuat, Anda juga dapat **menyalin `lib/main.dart` dan folder `assets/` dari ZIP revisi ke proyek `prototype`**, kemudian menjalankan `flutter create --platforms=android,ios .` di folder `prototype` sebelum `flutter pub get` dan `flutter run`. Pastikan `pubspec.yaml` sudah sesuai.

## Status
Kode Flutter merupakan **prototipe offline** dan belum terhubung dengan REST API Laravel. Perbaikan sintaks telah diperiksa secara statis; kompilasi dan tes emulator tetap harus dilakukan di komputer dengan Flutter SDK karena Flutter CLI tidak tersedia di lingkungan pembuatan paket.
