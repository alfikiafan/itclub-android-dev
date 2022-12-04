# Expanded & Flexible  

Sejauh ini kita telah mempelajari beberapa widget dasar dan bagaimana menyusunnya secara horizontal maupun vertikal. Dalam pengembangan aplikasi mobile kita tahu bahwa terdapat banyak sekali perangkat dengan ukuran layar yang berbeda pula. Untuk itu penting bagi kita untuk bisa menyusun tampilan yang responsif terhadap ukuran layar.

Kira-kira bagaimana kita akan menyusun layout dengan tampilan seperti berikut?

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/assets/6.2.1%20Layout.jpeg" alt="Expanded Layout" style="height: 600px;"/>  
</p>  

Tentunya akan sangat merepotkan apabila kita mengatur tinggi dari masing-masing kotak, bukan? Belum lagi jika harus mengembangkan aplikasi di ukuran yang lebih besar seperti perangkat tablet. 

## Expanded
Flutter memiliki widget Expanded yang dapat mengembangkan child dari Row atau Column sesuai dengan ruang yang tersedia. Cara menggunakannya Anda cukup membungkus masing-masing child ke dalam Expanded.
```dart
class Rainbow extends StatelessWidget {
  const Rainbow({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.orange,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.indigo,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}
```  

Saat aplikasi dijalankan, masing-masing container akan menempati ruang kosong yang ada. Jika Anda menjalankan di ukuran layar yang berbeda, maka ukuran container juga akan menyesuaikan.

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/assets/6.2.2%20Screen%20Layout.jpeg" alt="Expanded Layout Follows the Screen" style="height: 600px;"/>  
</p>  

Bisa kita lihat seluruh container menempati ruang dengan ukuran yang sama. Ini disebabkan Expanded memiliki parameter flex yang memiliki nilai default 1. Anda dapat mengubah nilai flex ini sesuai perbandingan yang diinginkan. Misalnya Anda memberikan nilai flex 2 pada salah satu container.

```dart
Expanded(
  flex: 2,
  child: Container(
    color: Colors.blue,
  ),
),
```  

Maka container berwarna biru ini akan menjadi lebih besar dengan perbandingan 2/(1 + 1 + 1 + 1 + 2 + 1 + 1) atau 2/8 dari halaman.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/assets/6.2.3%20Blue%20Container.jpeg" alt="Blue Container" style="height: 600px;"/>  
</p>  

## Flexible
Sama seperti Expanded, widget Flexible digunakan untuk mengatur ukuran widget di dalam Row atau Column secara fleksibel. Perbedaan Flexible dan Expanded adalah widget Flexible memungkinkan child widget-nya berukuran lebih kecil dibandingkan ukuran ruang yang tersisa. Sementara, child widget dari Expanded harus menempati ruang yang tersisa dari Column atau Row.

Berikut ini adalah contoh perbedaan antara Expanded dan Flexible:

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/assets/6.2.4%20Flexible.png" alt="Flexible" style="height: 600px;"/>  
</p>  

Kode untuk tampilan seperti di atas adalah seperti berikut:

```dart
class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: const [
                ExpandedWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: const [
                ExpandedWidget(),
                ExpandedWidget(),
              ],
            ),
            Row(
              children: const [
                FlexibleWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: const [
                FlexibleWidget(),
                ExpandedWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 
class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
 
class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
```

## Referensi
-   [Expanded Class](https://api.flutter.dev/flutter/widgets/Expanded-class.html)
-   [Flexible Class](hhttps://api.flutter.dev/flutter/widgets/Flexible-class.html)

## Navigasi
- Silabus: [Kembali ke Silabus](https://github.com/alfikiafan/ITCLUB-Android-Dev)
- Materi Sebelumnya: [ListView](https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/1%20-%20ListView.md) 
- Materi Setelahnya: [Navigation](https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/3%20-%20Navigation.md) 
