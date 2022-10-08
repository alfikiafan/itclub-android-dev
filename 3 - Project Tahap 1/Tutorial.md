## Gambaran Project
Contoh project pada IT CLUB ini adalah aplikasi yang menampilkan tempat-tempat wisata di Surakarta.  
Dalam pertama ini kita akan membuat sebuah tampilan yang menggabungkan semua widget-widget yang sebelumnya kita pelajari. Tampilannya adalah seperti berikut:  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/3%20-%20Project%20Tahap%201/assets/2%20-%20Final%20Step%201.png" alt="Project Tahap 1" style="height: 500px;"/>  
</p>  

Sebelum kita membuat tampilan di atas, kita akan bedah terlebih dahulu *layout*-nya.    
Pada layout di atas kita dapat memetakan widget-widget dalam bentuk diagram seperti di bawah ini:  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/3%20-%20Project%20Tahap%201/assets/3%20-%20Structure.png" alt="Struktur Tampilan" style="height: 500px;"/>  
</p>  

## Langkah-langkah
1. Buat project Flutter baru dan berikan nama yang sesuai, misalnya wisata_solo. Hapus kode aplikasi counter yang diberikan ketika project dibuat.
2. Tuliskan kode dasar yang menampilkan widget `MaterialApp` seperti berikut:  

```dart
import 'package:flutter/material.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Solo',
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
      title: 'Wisata Solo',
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

5. Komponen pertama yang akan kita buat adalah bagian judul dari halaman. Tentunya untuk menampilkan teks kita akan menggunakan widget Text.

```dart
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text('Keraton Kasunanan Surakarta'),
        ],
      ),
    );
  }
}
```  

6. Ketika kita menyimpan project atau menjalankan hot reload, tampilan aplikasi sekarang mungkin tidak sesuai dengan keinginan, seperti teks terlalu ke atas dan juga terlalu kecil.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/3%20-%20Project%20Tahap%201/assets/4%20-%20Too%20High.jpg" alt="Teks Terlalu ke Atas" style="height: 500px;"/>  
</p>  

Untuk itulah kita perlu membungkus widget Text ke dalam Container supaya kita dapat memberikan property seperti margin atau padding. Jika kalian menggunakan IDE Android Studio atau IntellijIDEA, kalian dapat memanfaatkan shortcut Alt+Enter untuk membungkus widget ke widget lain.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/3%20-%20Project%20Tahap%201/assets/5%20-%20Wrap%20with%20Container.gif" alt="Membungkus Teks dengan Container" style="height: 500px;"/>  
</p>  

7. Tambahkan margin atas supaya teks memiliki jarak terhadap bagian atas layar.  

```dart
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: const Text('Keraton Kasunanan Surakarta'),
          ),
        ],
      ),
    );
  }
}
```  

Pada kode di atas kita hanya memberikan margin atas sebesar sebesar 16.0. Anda dapat memanfaatkan metode `EdgeInsets` lain seperti `all()` untuk memberikan margin ke semua sisi atau `symmetric()` apabila Anda ingin memberikan margin ke sisi vertikal atau horizontal.  

8. Jika teman-teman kesulitan menentukan margin atas, khususnya pada perangkat yang memiliki notch yang umumnya memiliki status bar yang lebih besar, kita dapat memanfaatkan widget SafeArea.  

```dart
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text('Keraton Kasunanan Surakarta'),
            )
          ],
        ),
      ),
    );
  }
}
```  

Widget ini akan memberikan padding yang secara otomatis menyesuaikan perangkat yang digunakan.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/3%20-%20Project%20Tahap%201/assets/6%20-%20Automatic%20Padding.png" alt="Padding Otomatis dengan SafeArea" style="height: 500px;"/>  
</p>  

9. Selanjutnya, sesuai contoh kita akan membuat teks judul berada di tengah. Tambahkan parameter atau properti `textAlign` pada widget `Text`. Selain itu, tambahkan juga style dengan memperbesar ukuran teks agar tulisan dapat dibaca.  

```dart
Container(
  margin: EdgeInsets.only(top: 16.0),
  child: const Text(
    'Keraton Kasunanan Surakarta',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
  ),
),
```  

Lakukan hot reload. Tidak ada perubahan, apa sebabnya? Jika menggunakan Android Studio Anda dapat memanfaatkan fitur Flutter Inspector untuk melihat layout widget di dalam aplikasi.

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/3%20-%20Project%20Tahap%201/assets/7%20-%20Flutter%20Inspector.gif" alt="Penggunaan Flutter Inspector" style="height: 500px;"/>  
</p>  

Dari gambar di atas bisa kita lihat ternyata layout aplikasi kita tidak penuh hingga seluruh halaman. Ini disebabkan sisi horizontal dari Column hanya menyesuaikan dengan konten yang ada di dalamnya. Untuk memaksimalkan ukuran lebar dari Column, tambahkan kode berikut:  

```dart  
body: SafeArea(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Text(
          'Keraton Kasunanan Surakarta',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
),
```  

10. Setelah menyelesaikan judul, selanjutnya kita akan membuat bagian kedua yaitu informasi dari tempat wisata.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/3%20-%20Project%20Tahap%201/assets/8%20-%20Information%20Row.jpg" alt="Informasi Tempat Wisata"/>  
</p>  

Seperti yang terlihat kita perlu menyusun widget secara horizontal dan vertikal. Mari tambahkan child kedua dari Column dengan sebuah Container berisi Row. Tambahkan juga margin pada sisi atas dan bawah untuk memberikan jarak antar widget.  

```dart
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(...),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: <Widget>[],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```  
11. Buat widget Column untuk menyusun Icon dan Text.
```dart
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(...),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Icon(Icons.calendar_today),
                      Text('Open Saturday - Thursday'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```  

Jika kalian merasa jarak antara Icon dan Text terlalu rapat, Anda dapat menambahkan widget `SizedBox` untuk membuat “kotak” yang berguna untuk memberikan jarak.

```dart
Column(
  children: const <Widget>[
    Icon(Icons.calendar_today),
    SizedBox(height: 8.0),
    Text('Open Saturday - Thursday'),
  ],
),
```  

12. Selanjutnya sebagai tantangan, lengkapilah informasi tempat wisata dengan pasangan ikon dan teks sesuai contoh yang diberikan.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/3%20-%20Project%20Tahap%201/assets/8%20-%20Information%20Row.jpg" alt="Tantangan Pembuatan Informasi yang Lain"/>  
</p>  

13. Untuk menyusun Row seperti di atas, pastikan menggunakan `mainAxisAlignment` seperti ini:  

```dart
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(...),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(...),
                  Column(...),
                  Column(...)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```  

14. Pada langkah ini harusnya Anda sudah bisa menampilkan teks deskripsi sesuai langkah yang diberikan sebelumnya. Kalian cukup menambahkan widget `Container` dan `Text` untuk menampilkan konten deskripsi. Kalian juga dapat menambahkan style sesuai selera Anda.

```dart
Container(
  padding: const EdgeInsets.all(16.0),
  child: const Text(
    'Karaton Suråkartå Hadiningrat) adalah Istana resmi Kesunanan Surakarta Hadiningrat yang terletak di Kota Surakarta. Keraton ini didirikan oleh Sri Susuhunan Pakubuwana II pada tahun 1744 sebagai pengganti Keraton Kartasura yang porak-poranda akibat Geger Pecinan pada tahun 1743.',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 16.0),
  ),
),
```  

15. Akhirnya, kita berhasil menyusun widget dengan baik. Tampilan aplikasi akan seperti gambar berikut.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/3%20-%20Project%20Tahap%201/assets/2%20-%20Final%20Step%201.png" alt="Hasil Akhir Project Tahap 1"/>  
</p>  

Dengan menyelesaikan tahap ini, berarti kita sudah siap untuk melanjutkan ke bab Widget selanjutnya.

## Navigasi
- Kembali ke Silabus: [Silabus](https://github.com/alfikiafan/ITCLUB-Android-Dev)
- Bab Sebelumnya: [Widget (Bagian 1)](https://github.com/alfikiafan/ITCLUB-Android-Dev/tree/main/1%20-%20Dasar-Dasar%20Flutter)
- Bab Setelahnya: [Widget (Bagian 2)]()
