# latihanuts
1. Persiapan Firebase (Lembaga Pemasyarakatan Digital)
Sebelum masuk ke kode, kita siapkan "wadah" datanya terlebih dahulu.

Buka Firebase Console.
Buat Project Baru: Beri nama latihanuts.
Aktifkan Realtime Database:
Pilih menu Realtime Database di sidebar kiri.
Klik Create Database.
Pilih lokasi server (beberapa yang terdekat biasanya Singapore).
Pilih Start in test mode agar kita bisa baca/tulis data tanpa ribet urusan autentikasi saat UTS. Klik Enable.
Install Firebase CLI: (Jika belum punya) jalankan ini di terminal laptop Anda: npm install -g firebase-tools
Login ke Firebase: firebase login

Inisialisasi Project Flutter
Buka terminal di folder tempat Anda menyimpan tugas, lalu jalankan perintah berikut:
# Membuat project baru
flutter create latihanuts
# Masuk ke folder project
cd latihanuts
# Tambahkan dependencies yang diperlukan
flutter pub add firebase_core 
flutter pub add firebase_database

Konfigurasi Firebase ke Flutter (Cara Termudah)
Gunakan FlutterFire CLI agar Anda tidak perlu mengedit file AndroidManifest atau build.gradle secara manual.
# Install FlutterFire CLI
dart pub global activate flutterfire_cli
# Konfigurasi project (pilih project 'latihanuts' yang tadi dibuat)
flutterfire configure

-------------------jangan lupa firebase logout----------------------

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
