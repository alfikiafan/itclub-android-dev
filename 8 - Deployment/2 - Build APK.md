# Build APK

Project Flutter yang telah dibuat dapat kita build menjadi berkas .apk yang dapat berjalan di Android. Build APK adalah suatu proses membungkus aplikasi flutter menjadi format .apk yang nantinya untuk diinstal pada perangkat Android. Berikut tahapan ketika build aplikasi Flutter ke APK.

## AndroidManifest.xml
Sebelum mem-build APK, kita akan mengatur berkas `android/app/src/main/AndroidManifest.xml`. **AndroidManifest.xml** merupakan sebuah berkas yang berisikan informasi mengenai aplikasi Android yang akan di-build. Informasi-informasi tersebut berupa nama aplikasi, ikon, permission, screen orientation, dan lain-lain. Isi dari **AndroidManifest.xml** seperti berikut:  

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="id.eudeka.samples">
    <application
        android:name="io.flutter.app.FlutterApplication"
        android:label="samples"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <meta-data
              android:name="io.flutter.embedding.android.SplashScreenDrawable"
              android:resource="@drawable/launch_background"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
```

## Pengaturan Nama Aplikasi

Untuk mengatur nama aplikasi, kita cukup mengubah properti `android:label` yang ada pada file **AndroidManifest.xml** seperti berikut:

```xml
<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="common_widget"
        android:icon="@mipmap/ic_launcher">
```  

menjadi  

```xml
<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="Nama Aplikasi"
        android:icon="@mipmap/ic_launcher">
```  

Isikan android:label dengan nama aplikasi yang diinginkan. Atau Anda bisa gunakan library berikut untuk menghasilkan nama aplikasi dari pubspec.yaml.

<a href="https://pub.dev/packages/flutter_launcher_name" target="_blank">Library Launcher Name</a>  

## Pengaturan Ikon Aplikasi

Secara default ikon aplikasi Flutter kita adalah ikon Flutter. Untuk mengubah icon aplikasi dengan mudah, kita akan mengganti gambar `ic_launcher.png` yang berada pada folder `android/app/src/main/res/` yang terbagi menjadi berbagai mipmap (ukuran resolusi ikon).

Hal yang pertama kita lakukan adalah membuat ikon aplikasi dengan Android Asset Studio.

<a href="https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html" target="_blank">Android Asset Studio</a>  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/8%20-%20Deployment/assets/6.2.1%20Android%20Asset%20Studio%201.jpeg" alt="Android Asset Studio" style="height: 500px;"/>  
</p>  

Dengan Android Asset Studio, kita dapat membuat ikon aplikasi dengan mudah dan nantinya akan terbuat dalam berbagai resolusi (mipmap). Setelah membuat ikon sesuai dengan keinginan, tekan tombol download yang ada di kanan atas.

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/8%20-%20Deployment/assets/6.2.2%20Android%20Asset%20Studio%202.jpeg" alt="Android Asset Studio" style="height: 500px;"/>  
</p>  

Setelah mengunduh, unzip-lah berkas tersebut dan temukan folder `res/` di dalamnya. Lalu copy folder `res/` ke `android/app/src/main/res/` untuk mengganti `ic_launcher.png` pada setiap mipmap dengan ikon aplikasi yang baru. Atau kita bisa gunakan library <a href="https://pub.dev/packages/flutter_launcher_icons" target="_blank">berikut</a> untuk menghasilkan icon launcher dari **pubspec.yaml**.

## Pengaturan Perizinan Aplikasi

Ketika aplikasi dalam mode debug atau profil, perizinan internet akan secara otomatis ditambahkan. Namun ketika Anda ingin menjalankan atau membuatnya dalam mode rilis, Anda perlu menambahkan semua perizinan yang dibutuhkan pada **AndroidManifest**.

Untuk menambahkan perizinan pada aplikasi Android, Anda bisa menambahkan tag **uses-permission** pada **AndroidManifest**, di dalam tag manifest dan sejajar tag application. Contohnya seperti di bawah ini:  

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```  

## Melakukan Build APK

Setelah kita mengatur nama dan ikon aplikasi, langkah selanjutnya adalah melakukan build aplikasi menjadi APK. Sebelumnya terdapat tiga (3) jenis mode aplikasi yang perlu diketahui, yaitu debug, profile, dan release. APK debug umumnya digunakan untuk pengujian dan penggunaan aplikasi secara internal. Mode debug digunakan secara default ketika menjalankan aplikasi menggunakan perintah **flutter run**. Sementara untuk bisa dirilis melalui Google Play Store, Anda perlu membuat APK release. Sedangkan mode profile sama hal nya dengan release hanya saja tetap dapat di-debug menggunakan tools seperti DevTools dan tidak dapat dijalankan di emulator atau simulator.

Pada kali ini kita akan mempelajari bagaimana membuat APK debug. Caranya ialah menggunakan terminal pada Android Studio. Tekan tombol **Terminal** yang ada pada pojok kiri bawah.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/8%20-%20Deployment/assets/6.2.3%20Android%20Studio%20Terminal.png" alt="Android Studio/IntellijIDEA terminal" style="height: 500px;"/>  
</p>  
  
Bila menggunakan Visual Studio Code pilih menu terminal yang ada pada menu kiri atas. Lalu pilih new terminal.

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/8%20-%20Deployment/assets/6.2.4%20Visual%20Studio%20Code%20Terminal.png" alt="Visual Studio Code terminal" style="height: 500px;"/>  
</p>  

Jika terminal telah muncul, tuliskan perintah berikut:

```bash
flutter build apk --debug
```  

Tunggu hingga proses build berhasil. Setelah berhasil, hasil build yang berupa berkas **apk-debug.apk** akan terletak di folder `build/app/outputs/apk/debug/` atau akan muncul direktori tempat tersimpannya berkas ketika proses build selesai pada Terminal.

Untuk bisa mem-build apk release dan mengunggahnya melalui Google Play Store, Anda memerlukan signing key. Signing key ini digunakan sebagai tanda tangan supaya aplikasi Anda lebih aman. Secara default Flutter menggunakan debug key sebagai signing key sehingga Anda sebenarnya bisa membuat apk release dengan menjalankan perintah berikut:  

```bash
flutter build apk
```  

Namun, tentunya akan lebih baik jika Anda menggunakan signing key milik Anda sendiri. Cara untuk membuat signing key dan membuat apk release dapat Anda baca pada dokumentasi di bagian referensi.

## Referensi
-   [Android Deployment](https://flutter.dev/docs/deployment/android)

## Navigasi
- Silabus: [Kembali ke Silabus](https://github.com/alfikiafan/ITCLUB-Android-Dev)
- Materi Sebelumnya: [Tahap Deployment](https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/8%20-%20Deployment/1%20-%20Tahap%20Deployment.md)
