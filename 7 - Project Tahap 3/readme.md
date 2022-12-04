# Project Tahap 3: Menampilkan Daftar Tempat Wisata

Sekarang kita telah sampai pada project bagian ketiga. Di akhir codelab ini kita akan menyelesaikan project aplikasi Wisata Solo. Hasil akhir aplikasi akan seperti berikut:

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/3%20-%20Project%20Tahap%201/assets/1%20-%20Final%20Project.gif" alt="Hasil Akhir" style="height: 500px;"/>  
</p>  

Mari kita mulai. Buka kembali project kalian sebelumnya.

1. Pertama kali yang kita lakukan adalah membuat halaman baru untuk menampilkan daftar tempat wisata. Buat berkas baru main_screen.dart lalu buat widget untuk halaman MainScreen.  

```dart
import 'package:flutter/material.dart';
 
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
```  

2. Jangan lupa untuk mengganti halaman utama yang ditampilkan pada berkas main.dart.  

```dart
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Solo',
      theme: ThemeData(),
      home: const MainScreen(),
    );
  }
}
```  

3. Pada MainScreen tambahkan AppBar untuk judul halaman.  

```dart
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Solo'),
      ),
    );
  }
}
```  

4. Sebagai body dari Scaffold kita akan menggunakan widget Card. Widget ini adalah widget material design yang menghasilkan tampilan seperti kartu dengan ujung yang membulat dan bayangan di belakang. Kemudian susun Row dan Column seperti contoh untuk menyusun child dari Card. Kodenya akan seperti berikut:

```dart
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Solo'),
      ),
      body: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('images/Keraton_Kasunanan.jpeg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Keraton Kasunanan Surakarta',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Karaton Suråkartå Hadiningrat adalah Istana resmi Kesunanan Surakarta Hadiningrat yang terletak di Kota Surakarta. Keraton ini didirikan oleh Sri Susuhunan Pakubuwana II pada tahun 1744 sebagai pengganti Keraton Kartasura yang porak-poranda akibat Geger Pecinan pada tahun 1743.'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
```  
5. Jalankan aplikasinya. Aplikasi akan mengalami overflow karena aset gambar yang terlalu besar. Kita bisa saja mengatur tinggi gambar secara manual, namun kali ini kita akan memanfaatkan widget **Expanded** agar tampilan juga dapat menyesuaikan di perangkat yang lebih besar atau kecil. Bungkus masing-masing item dari widget **Row** ke dalam **Expanded**. Berikan parameter `flex` yang menurut Anda cocok.  

```dart
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Bandung'),
      ),
      body: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset('images/farm-house.jpg'),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Farm House Lembang',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Lembang'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```  
6. Item pertama Anda sudah siap. Selanjutnya kita akan membuat kartu ini bisa diklik untuk berpindah ke halaman detail. Kita bisa menggunakan widget **InkWell** yang menyediakan parameter `onTap`. Pindahkan widget **Card** Anda menjadi child dari **InkWell**.

```dart
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Bandung'),
      ),
      body: InkWell(
        onTap: () {},
        child: Card(...),
      ),
    );
  }
}
```  

7. Parameter `onTap` menerima argumen berupa sebuah fungsi lambda. Di sini kita akan menambahkan Navigator untuk berpindah ke halaman detail.  

```dart
onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return DetailScreen();
  }));
},
```  

Jalankan aplikasi. Seharusnya sampai langkah ini aplikasi Anda sudah dapat berpindah halaman ketika item diklik.  

8. Selanjutnya kita akan menampilkan beberapa item ke MainScreen. Di sini kita masih menggunakan data statis dan lokal yang disimpan pada objek List. Sebelumnya, buatlah kelas sebagai blueprint untuk menyimpan objek tempat wisata kita. Buat folder baru di dalam folder **lib** dengan cara klik kanan folder **lib -> New -> Package**, lalu berikan nama model. Di dalam folder model buat berkas dart bernama **tourism_place.dart**.  

9. Di dalam **tourism_place.dart** buat data class yang akan menjadi blueprint objek tempat wisata.

```dart
class TourismPlace {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String imageAsset;
  List<String> imageUrls;
 
  TourismPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageUrls,
  });
}
```

10. Siapkan data statis yang ingin ditampilkan Anda dapat menyalin kode berikut dan taruh di berkas **tourism_place.dart** paling bawah.

```dart
class TourismPlace {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String imageAsset;
  List<String> imageUrls;

  TourismPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var tourismPlaceList = [
  TourismPlace(
    name: 'Keraton Kasunanan Surakarta',
    location: 'Baluwarti, Pasarkliwon',
    description:
        'Karaton Suråkartå Hadiningrat adalah Istana resmi Kesunanan Surakarta Hadiningrat yang terletak di Kota Surakarta. Keraton ini didirikan oleh Sri Susuhunan Pakubuwana II pada tahun 1744 sebagai pengganti Keraton Kartasura yang porak-poranda akibat Geger Pecinan pada tahun 1743.',
    openDays: 'Open Saturday-Thursday',
    openTime: '09:00 - 14:00',
    ticketPrice: 'Rp 10.000',
    imageAsset: 'images/Keraton_Kasunanan.jpeg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/5a/d7/fe/kraton-surakarta-hadiningrat.jpg?w=1400&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/27/e3/91/sam-6480-largejpg.jpg?w=800&h=-1&s=1'
    ],
  ),
  TourismPlace(
    name: 'The Heritage Palace',
    location: 'Kartasura, Sukoharjo',
    description:
        'Destinasi wisata ini merupakan bangunan tua bekas pabrik gula Colomadu yang dibangun oleh pemerintahan Belanda. Kini, setelah disulap oleh pemerintah Indonesia, bangunan ini menjadi tempat wisata sejarah yang menarik dan instagramable. The Heritage Palace kini menjadi salah satu destinasi wisata menarik dan favorit bagi masyarakat. Selain itu, menawarkan pemandangan taman, museum seni, dan ruang konvensi.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 14:30',
    ticketPrice: 'Rp 55.000',
    imageAsset: 'images/The_Heritage_Palace.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/28/53/a2/scene-from-outdoor-balcony.jpg?w=800&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/28/53/8c/shadowy-wolf.jpg?w=800&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/28/53/55/arriving-at-heritage.jpg?w=800&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Taman Balekambang',
    location: 'Manahan, Banjarsari',
    description:
        'Taman Balekambang adalah taman yang dibangun oleh KGPAA Mangkunegara VII untuk kedua putrinya, yaitu GRAy Partini dan GRAy Partinah. Selain itu, taman yang terbagi dua juga diberi nama sesuai dengan nama kedua putri, yaitu Partinah Bosch yang merupakan semacam hutan kota, dan Partini Tuin, yang merupakan kolam air.',
    openDays: 'Open Everyday',
    openTime: '07.00-17.00',
    ticketPrice: 'Free',
    imageAsset: 'images/Taman_Balekambang.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/00/7d/81/taman-balekambang.jpg?w=1000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/00/7d/7b/taman-balekambang.jpg?w=1000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/00/7d/6e/taman-balekambang.jpg?w=1000&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Kampoeng Batik Laweyan',
    location: 'Laweyan, Laweyan',
    description:
        'Laweyan merupakan kawasan yang sangat terkenal sebagai pusat penghasil batik terbaik di Kota Solo dan sekitarnya. Kampung Batik Laweyan ini bahkan menjadi salah satu destinasi wisata di Solo yang paling ramai kunjungan wisatawan dari berbagai belahan dunia.',
    openDays: 'Open Everyday',
    openTime: '08:00 - 20:00',
    ticketPrice: 'Free',
    imageAsset: 'images/Kampoeng_Batik_Laweyan.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/78/42/6a/img20160811093925-largejpg.jpg?w=1600&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/99/07/02/salah-satu-stand-gallery.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/78/42/6e/img20160811092508-largejpg.jpg?w=1600&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Taman Sriwedari',
    location: 'Sriwedari, Laweyan',
    description:
    'Taman Sriwedari yang dulu dikenal sebagai Taman Raja ini berlokasi di Jalan Slamet Riyadi, No. 275, Kecamatan Lawedan, Kota Surakarta. Taman Sriwedari dibangun oleh Raja Kasunanan Surakarta, yaitu Sinuhun Pakubuwono X, sebagai tempat hiburan rakyat, abdi dalam, dan sentana dalem keraton.',
    openDays: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 7.000',
    imageAsset: 'images/Taman_Sriwedari.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/77/88/86/relief-on-the-gate.jpg?w=1400&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/77/88/8e/wayang-orang.jpg?w=700&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/05/55/03/taman-sriwedari-kota.jpg?w=2000&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Waduk Cengklik',
    location: 'Ngemplak, Boyolali',
    description:
        'Waduk ini memiliki pemandangan Gunung Merapi dan Gunung Merbabu yang cantik, membuat waduk ini cocok untuk menjadi tempat wisata. Pengunjung juga dapat menyewa kapal untuk mengelilingi waduk ini sembari menikmati sepoi sepoi angin, memandangi kapal kapal kecil serta enceng gondok yang segar dan saat sore hari disuguhkan dengan siluet pemandangan dengan cahaya keemasan yang memanjakan mata. ',
    openDays: 'Open Everyday',
    openTime: '08.30-18.00',
    ticketPrice: '25.000',
    imageAsset: 'images/Waduk_Cengklik.jpg',
    imageUrls: [
      'https://garuda.industry.co.id/uploads/berita/detail/48841.jpg',
      'https://cdn-2.tstatic.net/travel/foto/bank/images/waduk-cengklik-park-di-boyolali-1.jpg',
      'https://asset.kompas.com/crops/dMEa6zu7tyxXXrQLzoKR5pW_5do=/0x0:780x520/750x500/data/photo/2019/06/20/3151082006.jpg',
    ],
  ),
  TourismPlace(
    name: 'The Lawu Park',
    location: 'Tawangmangu, Karanganyar',
    description:
        'The Lawu Park merupakan salah satu obyek wisata unggulan di Tawangmangu yang menyajikan destinasi wisata alam yang sering jadi incaran wisatawan. Hawa yang digin serta pemandangan yang asri menjadikan daya tarik sendiri dari obyek wisata The Lawu Park.',
    openDays: 'Open Everyday',
    openTime: '08.00 - 17.00',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'images/The_Lawu_Park.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/d7/07/86/tempat-terbaik-untuk.jpg?w=1100&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/c2/c9/a2/the-lawu-park-pilihan.jpg?w=700&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/c2/c9/9f/the-lawu-park-pilihan.jpg?w=500&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Grojogan Sewu',
    location: 'Tawangmangu, Karanganyar',
    description:
        'Grojogan Sewu merupakan air terjun yang memiliki tinggi sekitar 81 meter. Air terjun ini memiliki debit air yang cukup besar, airnya tetap mengalir banyak walaupun sedang musim kemarau. Maka dari itu, tidak heran jika air terjun ini dinamai Grojogan Sewu yang bermakna ribuan air yang mengalir ke bawah. Tempat wisata ini memiliki dua pintu masuk, yang satu berada di atas dan yang lainnya berada di bawah. Jika wisatawan masuk dari atas maka bisa menemukan kera-kera yang bergelantungan di pohon.',
    openDays: 'Open Everyday',
    openTime: '08.00 - 16.00',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'images/Grojogan_Sewu.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/f9/b1/88/grojogan-sewu-waterfall.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/f9/b1/6c/grojogan-sewu-waterfall.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/f9/b1/0a/grojogan-sewu-waterfall.jpg?w=2000&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Kebun Teh Kemuning',
    location: 'Ngargoyoso, Karanganyar',
    description:
        'Kebun Teh Kemuning berada di area dataran tinggi sejuk karanganyar. Berlokasi tak terlalu jauh dari kota solo, area perkebunan menawarkan sensasi wisata kebun teh yang unik. Karanganyar seolah menjadi daerah “puncak”-nya Jawa Tengah. Jika di Jawa Barat ada Bogor yang sering ramai kala liburan. Kebun Teh ini memiliki pemandangan indah hijau alami dengan hamparan tanaman teh dimana-mana. Tidak hanya itu, objek wisata ini juga menyediakan berbagai wahana dan spot foto yang menarik.',
    openDays: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Free',
    imageAsset: 'images/Kebun_Teh_Kemuning.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/33/c2/79/kebun-teh-kemuning.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/64/0e/46/kemuning-tea-plantation.jpg?w=1000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/64/0e/3f/kemuning-tea-plantation.jpg?w=1000&h=-1&s=1',
    ],
  ),
];
```  

Jangan lupa untuk menambahkan import berkas **tourism_place.dart** pada file **main_screen.dart**.

```dart
import 'package:wisatasolo/model/tourism_place.dart';
```
Untuk berkas aset yang digunakan dapat Anda unduh pada tautan berikut.
<a href="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/7%20-%20Project%20Tahap%203/assets/assets_wisata.zip" target="_blank">Aset Wisata</a>  

11. Sesuai yang telah kita pelajari pada materi ListView, kita akan menampilkan variabel `tourismPlaceList` di atas menjadi item card yang dapat diklik. Tambahkan widget ListView sebagai body dari Scaffold. Pindahkan widget FlatButton dan seluruh konten di dalamnya sebagai widget dari setiap item di dalam `tourismPlaceList`.

```dart
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Bandung'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen();
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(place.imageAsset),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(place.location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}
```  

Jangan lupa untuk mengganti tampilan item secara dinamis sesuai data dari objek **TourismPlace**. Jalankan aplikasi untuk melihat hasil perubahan.  

12. Agar halaman detail bisa menampilkan informasi sesuai tempat wisata yang dipilih, kita perlu mengirimkan data TourismPlace melalui constructor. Buka berkas **detail_screen.dart** lalu tambahkan variabel serta constructor-nya.  

```dart
class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  const DetailScreen({Key? key, required this.place}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {...}
}
```  

Tambahkan keyword **required** agar parameter place wajib disertakan ketika membuat objek **DetailScreen**. Sesuaikan juga informasi yang ditampilkan dengan property yang didapat dari constructor.  

```dart
class DetailScreen extends StatelessWidget {
  final TourismPlace place;
 
  const DetailScreen({Key? key, required this.place}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(place.imageAsset),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
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
                        place.openDays,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time),
                      const SizedBox(height: 8.0),
                      Text(
                        place.openTime,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.monetization_on),
                      const SizedBox(height: 8.0),
                      Text(
                        place.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```  

Jangan lupa untuk menambahkan data **place** pada constructor.

```dart
Navigator.push(context, MaterialPageRoute(builder: (context) {
  return DetailScreen(place: place);
}));
```  

13. Selanjutnya, kita akan menambahkan tombol navigasi untuk kembali ke halaman daftar tempat wisata. Tombol ini akan kita taruh di atas gambar utama atau gambar dari aset. Kita akan menggunakan widget **Stack**. Widget ini digunakan untuk menyusun widget seperti Column atau Row, bedanya widget pada Stack disusun secara bertumpuk (stacked). Ubah kode Anda menjadi seperti berikut:  

```dart
Stack(
  children: <Widget>[
    Image.asset(place.imageAsset),
    IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {})
  ],
),
```  

Tambahkan fungsionalitas agar ketika icon back ini diklik akan kembali ke halaman sebelumnya.

```dart
IconButton(
  icon: const Icon(Icons.arrow_back),
  onPressed: () {
    Navigator.pop(context);
  },
),
```  

14. Jika Anda jalankan aplikasi, ikon ini akan sedikit menabrak notification bar pada perangkat Android. Hal ini akan semakin terlihat apabila Anda menggunakan perangkat yang memiliki notch.  
Lalu bagaimana mengatasinya? Masih ingat dengan SafeArea? Kita akan memanfaatkan widget SafeArea yang akan memberikan padding sesuai dengan sistem operasi yang digunakan sehingga widget akan berada di area yang aman. Buat widget SafeArea lalu pindahkan IconButton ke dalamnya. 

```dart
SafeArea(
  child: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
),
```  

Lakukan juga beberapa perubahan tampilan supaya ikon navigasi tidak bertabarakan dengan latar belakangnya.

```dart
SafeArea(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: CircleAvatar(
      backgroundColor: Colors.grey,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
  ),
),
```  

15. Terakhir, kita akan membuat fitur untuk menambahkan favorit. Fitur favorit ini memang belum lengkap, namun setidaknya cukup memberikan Anda gambaran bagaimana mengubah state aplikasi dan bagaimana widget dapat tampil sesuai dengan state yang ada.

Buat StatefulWidget pada berkas **detail_screen.dart**. Widget ini akan kita gunakan untuk menampilkan ikon favorit.

```dart
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);
 
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}
 
class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite_border),
      onPressed: () {},
    );
  }
}
```  

16. Tambahkan variabel boolean pada class `_FavoriteButtonState`. Variabel ini merupakan sebuah state yang dapat berubah dan widget kita akan tampil sesuai state-nya.  

```dart
bool isFavorite = false;
```  

State isFavorite ini akan berubah ketika ikon favorit diklik. Sehingga tambahkan kode untuk mengubah variabel **isFavorite**. Pastikan Anda memanggil fungsi `setState` untuk mengubah state.

 ```dart
 onPressed: () {
  setState(() {
    isFavorite = !isFavorite;
  });
},
```  

Ubah ikon yang ditampilkan sesuai dengan kondisi state. Pada kode di bawah ini kita menggunakan ekspresi ternary.

```dart
icon: Icon(
  isFavorite ? Icons.favorite : Icons.favorite_border,
  color: Colors.red,
),
```  

Tambahkan widget FavoriteButton ini sejajar dengan icon navigasi back.  

```dart
SafeArea(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        const FavoriteButton(),
      ],
    ),
  ),
),
```  

Jalankan aplikasi dan lihat perubahannya. Ketika ikon favorit diklik dan fungsi `setState()` dipanggil, maka method build akan kembali dijalankan dan widget akan dibuat dan ditampilkan menurut state-nya.  

Selamat! Anda telah menyelesaikan seluruh project dari Aplikasi Wisata Solo. Seluruh kodenya adalah seperti berikut:

**main.dart**

```dart
import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Solo',
      theme: ThemeData(),
      home: const MainScreen(),
    );
  }
}
```

**main_screen.dart**

```dart
import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Wisata Solo'),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return const TourismPlaceList();
              } else if (constraints.maxWidth <= 1200) {
                return const TourismPlaceGrid(gridCount: 4);
              } else {
                return const TourismPlaceGrid(gridCount: 6);
              }
            },
          ),
        );
      },
    );
  }
}

class TourismPlaceGrid extends StatelessWidget {
  final int gridCount;

  const TourismPlaceGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: tourismPlaceList.map((place) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(place: place);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        place.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        place.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        place.location,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(place.imageAsset),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(place.location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}
```  

**detail_screen.dart**

```dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'model/tourism_place.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(place: place);
        } else {
          return DetailMobilePage(place: place);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  const DetailMobilePage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
                        place.openDays,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time),
                      const SizedBox(height: 8.0),
                      Text(
                        place.openTime,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.monetization_on),
                      const SizedBox(height: 8.0),
                      Text(
                        place.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final TourismPlace place;

  const DetailWebPage({Key? key, required this.place}) : super(key: key);

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: Container(
            width: screenWidth <= 1200 ? 800 : 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Wisata Solo',
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(widget.place.imageAsset),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          const SizedBox(height: 16),
                          Scrollbar(
                            isAlwaysShown: true,
                            controller: _scrollController,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ListView(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                children: widget.place.imageUrls.map((url) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(url),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  widget.place.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'Staatliches',
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        widget.place.openDays,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  const FavoriteButton(),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.access_time),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    widget.place.openTime,
                                    style: informationTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.monetization_on),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    widget.place.ticketPrice,
                                    style: informationTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  widget.place.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Oxygen',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
```  

**tourism_place.dart**

```dart
class TourismPlace {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String imageAsset;
  List<String> imageUrls;

  TourismPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var tourismPlaceList = [
  TourismPlace(
    name: 'Keraton Kasunanan Surakarta',
    location: 'Baluwarti, Pasarkliwon',
    description:
        'Karaton Suråkartå Hadiningrat adalah Istana resmi Kesunanan Surakarta Hadiningrat yang terletak di Kota Surakarta. Keraton ini didirikan oleh Sri Susuhunan Pakubuwana II pada tahun 1744 sebagai pengganti Keraton Kartasura yang porak-poranda akibat Geger Pecinan pada tahun 1743.',
    openDays: 'Open Saturday-Thursday',
    openTime: '09:00 - 14:00',
    ticketPrice: 'Rp 10.000',
    imageAsset: 'images/Keraton_Kasunanan.jpeg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/5a/d7/fe/kraton-surakarta-hadiningrat.jpg?w=1400&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/27/e3/91/sam-6480-largejpg.jpg?w=800&h=-1&s=1'
    ],
  ),
  TourismPlace(
    name: 'The Heritage Palace',
    location: 'Kartasura, Sukoharjo',
    description:
        'Destinasi wisata ini merupakan bangunan tua bekas pabrik gula Colomadu yang dibangun oleh pemerintahan Belanda. Kini, setelah disulap oleh pemerintah Indonesia, bangunan ini menjadi tempat wisata sejarah yang menarik dan instagramable. The Heritage Palace kini menjadi salah satu destinasi wisata menarik dan favorit bagi masyarakat. Selain itu, menawarkan pemandangan taman, museum seni, dan ruang konvensi.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 14:30',
    ticketPrice: 'Rp 55.000',
    imageAsset: 'images/The_Heritage_Palace.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/28/53/a2/scene-from-outdoor-balcony.jpg?w=800&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/28/53/8c/shadowy-wolf.jpg?w=800&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/28/53/55/arriving-at-heritage.jpg?w=800&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Taman Balekambang',
    location: 'Manahan, Banjarsari',
    description:
        'Taman Balekambang adalah taman yang dibangun oleh KGPAA Mangkunegara VII untuk kedua putrinya, yaitu GRAy Partini dan GRAy Partinah. Selain itu, taman yang terbagi dua juga diberi nama sesuai dengan nama kedua putri, yaitu Partinah Bosch yang merupakan semacam hutan kota, dan Partini Tuin, yang merupakan kolam air.',
    openDays: 'Open Everyday',
    openTime: '07.00-17.00',
    ticketPrice: 'Free',
    imageAsset: 'images/Taman_Balekambang.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/00/7d/81/taman-balekambang.jpg?w=1000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/00/7d/7b/taman-balekambang.jpg?w=1000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/00/7d/6e/taman-balekambang.jpg?w=1000&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Kampoeng Batik Laweyan',
    location: 'Laweyan, Laweyan',
    description:
        'Laweyan merupakan kawasan yang sangat terkenal sebagai pusat penghasil batik terbaik di Kota Solo dan sekitarnya. Kampung Batik Laweyan ini bahkan menjadi salah satu destinasi wisata di Solo yang paling ramai kunjungan wisatawan dari berbagai belahan dunia.',
    openDays: 'Open Everyday',
    openTime: '08:00 - 20:00',
    ticketPrice: 'Free',
    imageAsset: 'images/Kampoeng_Batik_Laweyan.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/78/42/6a/img20160811093925-largejpg.jpg?w=1600&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/99/07/02/salah-satu-stand-gallery.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/78/42/6e/img20160811092508-largejpg.jpg?w=1600&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Taman Sriwedari',
    location: 'Sriwedari, Laweyan',
    description:
    'Taman Sriwedari yang dulu dikenal sebagai Taman Raja ini berlokasi di Jalan Slamet Riyadi, No. 275, Kecamatan Lawedan, Kota Surakarta. Taman Sriwedari dibangun oleh Raja Kasunanan Surakarta, yaitu Sinuhun Pakubuwono X, sebagai tempat hiburan rakyat, abdi dalam, dan sentana dalem keraton.',
    openDays: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 7.000',
    imageAsset: 'images/Taman_Sriwedari.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/77/88/86/relief-on-the-gate.jpg?w=1400&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/77/88/8e/wayang-orang.jpg?w=700&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/05/55/03/taman-sriwedari-kota.jpg?w=2000&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Waduk Cengklik',
    location: 'Ngemplak, Boyolali',
    description:
        'Waduk ini memiliki pemandangan Gunung Merapi dan Gunung Merbabu yang cantik, membuat waduk ini cocok untuk menjadi tempat wisata. Pengunjung juga dapat menyewa kapal untuk mengelilingi waduk ini sembari menikmati sepoi sepoi angin, memandangi kapal kapal kecil serta enceng gondok yang segar dan saat sore hari disuguhkan dengan siluet pemandangan dengan cahaya keemasan yang memanjakan mata. ',
    openDays: 'Open Everyday',
    openTime: '08.30-18.00',
    ticketPrice: '25.000',
    imageAsset: 'images/Waduk_Cengklik.jpg',
    imageUrls: [
      'https://garuda.industry.co.id/uploads/berita/detail/48841.jpg',
      'https://cdn-2.tstatic.net/travel/foto/bank/images/waduk-cengklik-park-di-boyolali-1.jpg',
      'https://asset.kompas.com/crops/dMEa6zu7tyxXXrQLzoKR5pW_5do=/0x0:780x520/750x500/data/photo/2019/06/20/3151082006.jpg',
    ],
  ),
  TourismPlace(
    name: 'The Lawu Park',
    location: 'Tawangmangu, Karanganyar',
    description:
        'The Lawu Park merupakan salah satu obyek wisata unggulan di Tawangmangu yang menyajikan destinasi wisata alam yang sering jadi incaran wisatawan. Hawa yang digin serta pemandangan yang asri menjadikan daya tarik sendiri dari obyek wisata The Lawu Park.',
    openDays: 'Open Everyday',
    openTime: '08.00 - 17.00',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'images/The_Lawu_Park.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/d7/07/86/tempat-terbaik-untuk.jpg?w=1100&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/c2/c9/a2/the-lawu-park-pilihan.jpg?w=700&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/c2/c9/9f/the-lawu-park-pilihan.jpg?w=500&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Grojogan Sewu',
    location: 'Tawangmangu, Karanganyar',
    description:
        'Grojogan Sewu merupakan air terjun yang memiliki tinggi sekitar 81 meter. Air terjun ini memiliki debit air yang cukup besar, airnya tetap mengalir banyak walaupun sedang musim kemarau. Maka dari itu, tidak heran jika air terjun ini dinamai Grojogan Sewu yang bermakna ribuan air yang mengalir ke bawah. Tempat wisata ini memiliki dua pintu masuk, yang satu berada di atas dan yang lainnya berada di bawah. Jika wisatawan masuk dari atas maka bisa menemukan kera-kera yang bergelantungan di pohon.',
    openDays: 'Open Everyday',
    openTime: '08.00 - 16.00',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'images/Grojogan_Sewu.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/f9/b1/88/grojogan-sewu-waterfall.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/f9/b1/6c/grojogan-sewu-waterfall.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/f9/b1/0a/grojogan-sewu-waterfall.jpg?w=2000&h=-1&s=1',
    ],
  ),
  TourismPlace(
    name: 'Kebun Teh Kemuning',
    location: 'Ngargoyoso, Karanganyar',
    description:
        'Kebun Teh Kemuning berada di area dataran tinggi sejuk karanganyar. Berlokasi tak terlalu jauh dari kota solo, area perkebunan menawarkan sensasi wisata kebun teh yang unik. Karanganyar seolah menjadi daerah “puncak”-nya Jawa Tengah. Jika di Jawa Barat ada Bogor yang sering ramai kala liburan. Kebun Teh ini memiliki pemandangan indah hijau alami dengan hamparan tanaman teh dimana-mana. Tidak hanya itu, objek wisata ini juga menyediakan berbagai wahana dan spot foto yang menarik.',
    openDays: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Free',
    imageAsset: 'images/Kebun_Teh_Kemuning.jpg',
    imageUrls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/33/c2/79/kebun-teh-kemuning.jpg?w=2000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/64/0e/46/kemuning-tea-plantation.jpg?w=1000&h=-1&s=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/64/0e/3f/kemuning-tea-plantation.jpg?w=1000&h=-1&s=1',
    ],
  ),
];
```  

Kalian dapat mengunduh seluruh kodenya pada folder source code.

**Tambahan:** Flutter dikenal dengan framework-nya yang sangat mudah dalam menghadirkan tampilan yang menarik termasuk menambahkan animasi. Salah satu yang paling mudah adalah Hero Animation. Sebagai tantangan, bisakah kalian menambahkan Hero Animation pada aplikasi kalian?
