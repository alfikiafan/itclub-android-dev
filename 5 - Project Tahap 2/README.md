# Project Tahap 2: Perbaikan Tampilan Aplikasi  
Setelah mempelajari beberapa materi tambahan, sekarang saatnya kita melanjutkan project aplikasi wisata kita. Pada codelab ini kita akan membuat aplikasi dengan tampilan seperti berikut:  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/5%20-%20Project%20Tahap%202/assets/1%20-%20Example.png" alt="Project Tahap 2" style="height: 500px;"/>  
</p>  

## Langkah-Langkah  
1. Mari kita mulai dengan membuka dan melanjutkan project kita sebelumnya.
2. Untuk memudahkan dalam membaca sekaligus merapikan kode, mari kita pindahkan widget atau kelas DetailScreen ke sebuah file dart baru. Kita dapat membuat file baru dengan cara klik kanan pada folder lib -> New -> File. Berikan nama detail_screen.dart.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/5%20-%20Project%20Tahap%202/assets/2%20-%20Create%20New%20File.png" alt="Add new file" style="height: 500px;"/>  
</p>  

4. Kita akan mendapati beberapa eror akibat adanya library atau package yang belum terpasang. Pada file detail_screen.dart tambahkan kode import berikut di baris paling atas untuk menggunakan package material design di dalam file.  

```dart
import 'package:flutter/material.dart';
```  

Selanjutnya karena kita akan menggunakan file widget DetailScreen di file main.dart, maka kita juga perlu melakukan import berkas detail_screen.dart ke dalam berkasi main.dart.

```dart  
import 'detail_screen.dart';
```  

Kemudian kita akan menambahkan sebuah gambar ke tampilan paling atas halaman. Gambar ini akan kita ambil dari asset. Untuk itu, kita perlu menambahkan berkas yang ingin ditampilkan ke dalam project dan menambahkannya pada file pubspec.yaml.

```yaml
flutter:  
  uses-material-design: true
  assets:
    - images/
```  

Tambahkan widget Image di child paling atas dari Column.  

```dart
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/Keraton_Kasunanan.jpeg'),
            Container(...),
            Container(...),
            Container(...),
          ],
        ),
      ),
    );
  }
}
```  

Jalankan aplikasi kalian untuk melihat perubahan.  

6. Selanjutnya kita akan menampilkan beberapa gambar lagi di bagian bawah. Kali ini kita akan mengambil gambar melalui url. Mari kita mulai dengan satu gambar terlebih dahulu.  

```dart
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/Keraton_Kasunanan.jpeg'),
            Container(...),
            Container(...),
            Container(...),
            Image.network(
    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1'),
          ],
        ),
      ),
    );
  }
}
```  

Apabila gambar yang kita tampilkan terlalu besar sementara layar pada perangkat terlalu kecil, maka akan terlihat tampilan garis hitam-kuning yang menunjukkan terjadi overflow. Kondisi overflow ini terjadi ketika konten yang kita tampilkan melebihi luas layar yang ada.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/5%20-%20Project%20Tahap%202/assets/3%20-%20Overflow.png" alt="Overflow" style="height: 500px;"/>  
</p>  

7. Sebagai solusi, tentunya kita bisa mengubah ukuran dari gambar, namun tentunya tidak praktis jika kita harus mengubah ukuran setiap gambar yang ditampilkan. Tentu ada banyak sekali ukuran layar yang tersedia, bukan? Solusi lainnya yaitu dengan menerapkan scrolling. Salah satu widget scrolling yang bisa kita manfaatkan adalah `SingleChildScrollView`. Widget ini membutuhkan satu child yang nantinya bisa di-scroll pada layar. Pindahkan widget Column ke dalam `SingleChildScrollView` supaya nantinya bisa di-scroll.

```dart
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/Keraton_Kasunanan.jpeg'),
              Container(...),
              Container(...),
              Container(...),
              Image.network(
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1'),
            ],
          ),
        ),
      ),
    );
  }
}
```  

Jalankan hot reload. Semestinya masalah overflow sudah tuntas dengan adanya tambahan scrolling.  

8. Selanjutnya kita akan menambahkan beberapa gambar lagi yang disusun secara horizontal. Kalian mungkin mengira untuk menggunakan widget Row supaya gambar bisa tersusun secara horizontal. Namun, perlu diingat bahwa kita juga memerlukan fitur scrolling agar tidak terjadi overflow. Oleh karena itu, kita akan menggunakan `ListView`. Widget ini memungkinkan kita untuk menerapkan scrolling terhadap beberapa item (children).  

```dart
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/Keraton_Kasunanan.jpeg'),
              Container(...),
              Container(...),
              Container(...),
              ListView(
                children: [
                  Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1'),
                  Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/5a/d7/fe/kraton-surakarta-hadiningrat.jpg?w=1400&h=-1&s=1'),
                  Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/27/e3/91/sam-6480-largejpg.jpg?w=800&h=-1&s=1'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```  

Jika kita menjalankan aplikasi atau melakukan hot reload, aplikasi Akitanda akan menjadi blank dan muncul pesan eror pada log. Kenapa ya? ListView diletakkan di dalam Column, di mana keduanya sama-sama memiliki atribut height yang memakan space di sepanjang layar. Sebagai solusi kita perlu memberikan ukuran tinggi yang statis terhadap ListView. Namun ListView tidak memiliki parameter height, lantas bagaimana nih? Caranya, gunakan widget lain yang memiliki parameter height. kita dapat membungkus widget ListView ke dalam Container atau pun SizedBox. Ukuran tinggi ini nantinya juga digunakan sebagai tinggi Image yang tampil.  

```dart
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/Keraton_Kasunanan.jpeg'),
              Container(...),
              Container(...),
              Container(...),
              SizedBox(
                height: 150,
                child: ListView(
                  children: [
                    Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1'),
                    Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/5a/d7/fe/kraton-surakarta-hadiningrat.jpg?w=1400&h=-1&s=1'),
                    Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/27/e3/91/sam-6480-largejpg.jpg?w=800&h=-1&s=1'),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```  

9. Secara default arah scroll dari `ListView` adalah vertikal. Untuk mengubahnya menjadi horizontal kita cukup menambahkan parameter `scrollDirection` bernilai `Axis.horizontal`.  

```dart
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/Keraton_Kasunanan.jpeg'),
              Container(...),
              Container(...),
              Container(...),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1'),
                    Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/5a/d7/fe/kraton-surakarta-hadiningrat.jpg?w=1400&h=-1&s=1'),
                    Image.network(
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/27/e3/91/sam-6480-largejpg.jpg?w=800&h=-1&s=1'),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```  

10. Selanjutnya, kita akan sedikit merapikan tampilan gambar supaya terlihat lebih rapi dan menarik. Tambahkan Padding pada masing-masing Image supaya antar gambar tidak terlalu rapat.

```dart
SizedBox(
  height: 150,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.network(
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1'),
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.network
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/5a/d7/fe/kraton-surakarta-hadiningrat.jpg?w=1400&h=-1&s=1'),
      ),
      Padding(
       padding: const EdgeInsets.all(4.0),
       child: Image.network(
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/27/e3/91/sam-6480-largejpg.jpg?w=800&h=-1&s=1'),
      ),
    ],
  ),
),
```  

Bagaimana membuat gambar memiliki sudut yang membulat seperti pada contoh? Sekali lagi, dokumentasi adalah sahabat terbaik kita dalam mengembangkan aplikasi Flutter. kita dapat memanfaatkan mesin pencari untuk menemukan widget sesuai keinginan. Misalnya, dengan memanfaatkan Google kita dapat menemukan bahwa ada widget yang memungkinkan gambar memiliki radius, yaitu **ClipRRect**. Masukkan widget Image kita sebagai child dari **ClipRRect** dan berikan `borderRadius`, maka kita akan mendapatkan Image dengan sudut yang tak bersiku.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/5%20-%20Project%20Tahap%202/assets/4%20-%20Horizontal%20Scrolling.gif" alt="Border Radius" style="height: 500px;"/>
</p>  

Terakhir, kita akan menggunakan custom Font. Kita bebas menggunakan font kesukaan kita. Pada contoh ini akan menggunakan font <a href="https://fonts.google.com/specimen/Staatliches" target="_blank">Staatliches</a> dan <a href="https://fonts.google.com/specimen/Oxygen" target="_blank">Oxygen</a>. Tambahkan font yang akan digunakan ke dalam project dan daftarkan pada pubscpec.yaml.

```yaml
flutter:
  uses-material-design: true
 
  assets:
    - images/
 
  fonts:
    - family: Staatliches
      fonts:
        - asset: fonts/Staatliches-Regular.ttf
    - family: Oxygen
      fonts:
        - asset: fonts/Oxygen-Regular.ttf
```  

13. Tambahkan parameter **fontFamily** pada widget **TextStyle** untuk menerapkan style pada Text.  
```dart
Container(
  margin: EdgeInsets.only(top: 16.0),
  child: Text(
    'Keraton Kasunanan',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 30.0,
      fontFamily: 'Staatliches',
    ),
  ),
),
```

14. Jika kalian memiliki beberapa teks dengan style yang sama, kalian dapat menggunakan variabel untuk menyimpan TextStyle dan meringkas kode.
```dart
var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');
```  
Gunakan variabel tersebut pada masing-masing widget yang membutuhkan.
```dart
children: <Widget>[
  Column(
    children: <Widget>[
      const Icon(Icons.calendar_today),
      const SizedBox(height: 8.0),
      Text(
        'Open Saturday-Thursday',
        style: informationTextStyle,
      ),
    ],
  ),
  Column(
    children: <Widget>[
      const Icon(Icons.access_time),
      const SizedBox(height: 8.0),
      Text(
        '09:00 - 14:00',
        style: informationTextStyle,
      )
    ],
  ),
  Column(
    children: <Widget>[
      const Icon(Icons.monetization_on),
      const SizedBox(height: 8.0),
      Text(
        'Rp 10.000',
        style: informationTextStyle,
      ),
    ],
  )
],
```  

15. Jalankan aplikasi untuk melihat hasil akhir dari codelab ini.
<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/5%20-%20Project%20Tahap%202/assets/5%20-%20Final.png" alt="Hasil Final"
</p>  
  
Kalian dapat menghapus widget **SafeArea** jika dirasa tampilan tanpa SafeArea jadi lebih baik.  
  
16. Seluruh kodenya adalah seperti berikut:  
  
```dart
  import 'package:flutter/material.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/Keraton_Kasunanan.jpeg'),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                'Keraton Kasunanan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.calendar_today),
                      const SizedBox(height: 8.0),
                      Text(
                        'Open Saturday-Thursday',
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time),
                      const SizedBox(height: 8.0),
                      Text(
                        '09:00 - 14:00',
                        style: informationTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.monetization_on),
                      const SizedBox(height: 8.0),
                      Text(
                        'Rp 10.000',
                        style: informationTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Karaton Suråkartå Hadiningrat adalah Istana resmi Kesunanan Surakarta Hadiningrat yang terletak di Kota Surakarta. Keraton ini didirikan oleh Sri Susuhunan Pakubuwana II pada tahun 1744 sebagai pengganti Keraton Kartasura yang porak-poranda akibat Geger Pecinan pada tahun 1743.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/5a/d7/fe/kraton-surakarta-hadiningrat.jpg?w=1400&h=-1&s=1'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/27/e3/91/sam-6480-largejpg.jpg?w=800&h=-1&s=1'),
                    ),
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
Dengan menyelesaikan tahap ini, berarti kita sudah siap untuk melanjutkan ke bab Widget selanjutnya.

## Navigasi
- Kembali ke Silabus: [Silabus](https://github.com/alfikiafan/ITCLUB-Android-Dev)
- Bab Sebelumnya: [Widget (Bagian 2)](https://github.com/alfikiafan/ITCLUB-Android-Dev/tree/main/2%20-%20Widget%20(Bagian%202))
- Bab Setelahnya: [Widget (Bagian 3)](https://github.com/alfikiafan/ITCLUB-Android-Dev/tree/main/4%20-%20Widget%20(Bagian%203))
