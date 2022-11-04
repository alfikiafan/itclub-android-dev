# Font
Dalam proses pengembangan aplikasi, seorang desainer User Interface bisa saja menggunakan font berbeda dengan font default. Sebagai pembuat kode aplikasi, kita diharuskan menambahkan font pada aplikasi yang dirancang oleh desainer agar sesuai dengan desain User Interface.

Pada pembelajaran kali ini kita akan belajar cara menambahkan font pada Flutter. Sebelum kita memulai pembelajaran, kita akan mengunduh font yang ada di internet atau menggunakan font yang telah dimiliki. Pada contoh ini kita akan menggunakan font unik buatan salah satu warga Indonesia untuk menuliskan aksara jawa, yaitu font [Hanacaraka](https://fonts.webtoolhub.com/font-n24517-hanacaraka-normal.aspx).

## Menambahkan Font ke Project
Setelah mengunduh font, masukkan file-file font tersebut ke folder project. Biasanya, font dimasukkan ke folder nama_project/fonts, seperti ini:  

<p align="center">
<img src= "https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.4.1%20Add%20Font.png" alt="Add Font to Project" style="height: 400px;"/>  
</p>  

## Mendaftarkan Font di pubspec.yaml
Sama halnya dengan gambar, kita perlu mendaftarkan font pada berkas **pubspec.yaml** sebagai asset seperti berikut:  

```yaml
flutter:
  uses-material-design: true
  
  assets:
    - images/

  fonts:
    - family: Hanacaraka
      fonts:
        - asset: fonts/Hanacaraka/Hanacaraka-Normal.ttf
```  

Seperti dengan gambar, font ada dalam bagian flutter. Untuk mendaftarkan font, kita membuat bagian fonts yang ada dalam blok flutter.

Untuk mendaftarkan font Hanacaraka, kita tuliskan "Hanacaraka" pada bagian *family* yang nantinya akan menjadi nama font yang kita panggil pada kode dart. Lalu dalam *family* kita masukkan fonts yang di dalamnya terdapat asset yang nanti akan mengarah pada file font.ttf. Contoh di atas kita menambahkan asset *fonts/Hanacaraka/Hanacaraka-Normal.ttf*.

## Menggunakan Font pada Kode
Setelah kita mendaftarkan font pada **pubspec.yaml** kita akan gunakan font tersebut pada kode kita. Seperti contoh di bawah ini kita akan menggunakan font pada widget **Text**:  

```dart
Text(
  'Custom Font',
  style: TextStyle(
    fontFamily: 'Hanacaraka',
    fontSize: 30,
  ),
),
```  

Pada kode di atas kita menambahkan `fontFamily` pada `TextStyle`. Kita cukup panggil nama font family yang telah kita daftarkan pada **pubspec.yaml**. Hasilnya akan seperti berikut:  

<p align="center">
<img src= "https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.4.2%20Font%20Result.jpeg" alt="Font Result" style="height: 600px;"/>  
</p>  

Tulisan "alP+ikiap+n\\" dari kode akan berubah menjadi font Hanacaraka sesuai dengan yang telah kita daftarkan.
Dalam aksara jawa, teks di atas dibaca: "Alfiki Afan".

Setelah kita menambahkan package atau pun asset ke dalam **pubspec.yaml**, jangan lupa untuk melakukan **full restart** agar asset yang baru dapat digunakan dalam aplikasi.

## Mengubah Font Default
Selain kita dapat mengubah font family pada satu per satu widget Text, kita dapat membuat font yang kita daftarkan menjadi *default*. Caranya dengan menambahkan parameter `fontFamily` pada kelas `ThemeData` yang ada pada *parameter theme* di **MaterialApp** seperti berikut:

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Hanacaraka',
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}
```  
## Navigasi
- Silabus: [Kembali ke Silabus](https://github.com/alfikiafan/ITCLUB-Android-Dev)
- Materi Sebelumnya: [Image](https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/3%20-%20Image.md)
