# Image
Gambar diperlukan untuk membuat tampilan menjadi semakin menarik atau untuk menyajikan informasi lebih lengkap. Dengan adanya gambar membuat aplikasi kita menjadi lebih baik lagi. Pada materi kali ini kita akan belajar bagaimana menampilkan gambar dari internet dan project asset.  

## Image.network
Untuk menampilkan gambar yang bersumber dari internet, kita akan menggunakan method Image.network. Cara penulisan method ini sebagai berikut:  

```dart
Image.network(url)
```  

Di method ini, kita cukup menambahkan URL gambar dari internet. Jika kita butuh kustomisasi, kita pun dapat menambahkan width dan height juga. Di bawah ini adalah contoh penggunaan Image.network:  

```dart
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Image.network(
          'https://picsum.photos/200/300',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
```  

Pada kode di atas kita panggil method Image.network dengan url https://picsum.photos/200/300 lalu width dan height-nya diberikan masing-masing 200. Sehingga hasilnya seperti berikut:  

<p align="center">
<img src= "https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.3.1%20Image.network.png" alt="Image.network" style="height: 600px;"/>  
</p>  

## Image.asset
Selain dari internet, kita juga dapat menampilkan gambar yang bersumber dari aset proyek. Aset ini berupa gambar-gambar yang nantinya didaftarkan pada project. Untuk mendaftarkan asset gambar pada project kita harus menambahkannya pada berkas pubspec.yaml.

Pertama kita harus menambahkan terlebih dahulu gambar yang akan didaftarkan ke dalam folder project kita. Saat ini Flutter mendukung beberapa jenis format gambar, seperti JPEG, PNG, GIF, Animated GIF, WebP, Animated WebP, BMP, dan WBMP. Di luar format tersebut, Flutter akan memanfaatkan API dari masing-masing platform. Jika platform native mendukung format gambar yang digunakan, maka gambar tersebut akan bisa di-render oleh Flutter. Jika tidak, kita perlu mengubah format gambar terlebih dahulu agar gambar bisa di-render.

Pada contoh berikut kita menambahkan folder images/ pada folder project.

<p align="center">
<img src= "https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.3.2%20Add%20Image%20Folder.png" alt="Image.network" style="height: 600px;"/>  
</p>  

Masukkan berkas gambar yang ingin Anda gunakan ke dalam folder image. Sebagai contoh kita menggunakan gambar bernama [Android.png]([https://link-url-here.org](https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.3.3%20Android.png))  
Setelah menambahkan gambar pada project, saatnya kita mendaftarkan gambar tersebut pada file bernama **pubspec.yaml**.  
Di dalam berkas **pubspec.yaml**, kita bisa mendaftarkan aset gambar pada bagian flutter seperti di bawah ini:  

```yaml
...
flutter:
 
  uses-material-design: true
 
  # To add assets to your application, add an assets section, like this:
  # assets:
  #  - images/a_dot_burr.jpeg
  #  - images/a_dot_ham.jpeg
  
...
```  

Daftarkan aset gambar seperti ini:  

```yaml
...
flutter:
  uses-material-design: true
 
  assets:
    - images/android.png
...
```  

Hapus juga tanda pagar (#) atau komentar yang tidak diperlukan. Perhatikan pula indentasi kodenya. `assets`: berada sejajar dengan `uses-material-design`: yaitu berjarak 2 spasi dari ujung dan berada di dalam `flutter:` sedangkan `- images/android.png` berada di dalam `assets:` dan berjarak 4 spasi dari ujung.

Pada contoh di atas kita telah menambahkan asset yang berisi lokasi gambar atau aset yang ingin kita gunakan. Karena kita menambahkan gambar **android.png** pada folder _images_, maka lokasi gambar tersebut adalah **images/android.png**.

Jika terdapat banyak gambar yang kita masukkan ke dalam lokasi folder, daripada menuliskan lokasi gambar satu per satu, lebih baik langsung menuliskan folder **images/** seperti berikut:  

```yaml
...
flutter:
 
  uses-material-design: true
 
  assets:
    - images/
...
```

Setelah menambahkan _assets_, kita harus me-_refresh_ **pubspec.yaml** dengan cara _save file_ pubspec.yaml bila menggunakan Visual Studio Code atau menekan 'Packages get' yang ada di pojok kanan atas untuk Android Studio.  
Setelah kita menambahkan asset ke dalam pubspec.yaml kita perlu melakukan full restart agar asset yang baru dapat digunakan dalam aplikasi.  
Kita telah mendaftarkan suatu asset. Sekarang kita akan panggil asset tersebut pada kode kita dengan method `Image.asset`. Cara penulisannya seperti ini:  

```dart
Image.asset(lokasi_asset)
```  

Contoh di dalam kodenya adalah sebagai berikut:  

```dart
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Image.asset('images/Android.png', width: 200, height: 200),
      ),
    );
  }
}
```  

Jika aplikasi Flutter dijalankan, maka gambar akan tampil seperti di bawah ini:  

<p align="center">
<img src= "https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.3.4%20Hasil.png" alt="Hasil penambahan gambar" style="height: 600px;"/>  
</p>  
