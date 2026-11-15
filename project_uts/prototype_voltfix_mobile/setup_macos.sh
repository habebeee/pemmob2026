#!/bin/sh
set -eu
cd "$(dirname "$0")"
if ! command -v flutter >/dev/null 2>&1; then
  echo 'Flutter tidak ditemukan di PATH. Buka Terminal Android Studio dan pastikan perintah flutter --version berhasil.'
  exit 1
fi
flutter create --platforms=android,ios --project-name voltfix_mobile .
flutter pub get
printf '\nSetup selesai. Pilih emulator lalu jalankan flutter run.\n'
