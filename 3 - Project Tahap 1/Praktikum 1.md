# Project Tahap 1
## Penafian
Penjelasan yang ada di folder ini hanya untuk membantu pelaksanaan project. Kalian bebas untuk membuat project Flutter apa saja dengan menggunakan widget yang telah kita pelajari sebelumnya. Jika ada pertanyaan, silakan menghubungi fasilitator atau bertanya ke grup WhatsApp.

## Gambaran Project
Contoh project pada IT CLUB ini adalah aplikasi yang menampilkan tempat-tempat wisata di Surakarta.  
Dalam pertama ini kita akan membuat sebuah tampilan yang menggabungkan semua widget-widget yang sebelumnya kita pelajari. Tampilannya adalah seperti berikut:

Sebelum kita membuat tampilan di atas, kita akan bedah terlebih dahulu *layout*-nya.    
Pada layout di atas kita dapat memetakan widget-widget dalam bentuk diagram seperti di bawah ini:

## Langkah-langkah
1. Buat project Flutter baru dan berikan nama yang sesuai, misalnya wisatasurakarta. Hapus kode aplikasi counter yang diberikan ketika project dibuat.
2. Tuliskan kode dasar yang menampilkan widget `MaterialApp` seperti berikut:  

```dart
import 'package:flutter/material.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Surakarta',
      theme: ThemeData(),
    );
  }
}
```  

3. Lalu kita akan membuat kode untuk susunan widget sesuai diagram yang telah kita buat. Untuk membuat kode kita lebih rapi kita akan membuat kelas Stateless Widget baru untuk menampung kode tampilan kita. Mari namakan kelas ini `DetailScreen`.  

```dart
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
```  

Jangan lupa untuk menambahkan widget `DetailScreen` sebagai home dari `MaterialApp`.  

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Surakarta',
      theme: ThemeData(),
      home: const DetailScreen(),
    );
  }
}
```

4. Sesuai diagram di atas, kita akan menyusun beberapa widget secara vertikal sehingga kita perlu menggunakan widget Column.  

```dart
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}
```  

Jalankan aplikasi. Saat ini device atau emulator memang masih belum menampilkan apa pun. Namun, kita akan memanfaatkan fitur hot reload untuk melihat perubahan-perubahan yang akan kita lakukan ke depan.  
