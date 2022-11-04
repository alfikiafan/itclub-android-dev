# Button  
Sekarang kita akan belajar menggunakan widget button. Widget button ini adalah widget yang dapat menerima rangsangan sentuhan atau dapat melakukan suatu fungsi ketika disentuh, jenis-jenis widget button antara lain:  

## ElevatedButton  
ElevatedButton merupakan bagian dari Material Design widget dari Flutter. Untuk menggunakan ElevatedButton ikuti kode di bawah ini:  

```dart
ElevatedButton(
  child: const Text("Tombol"),
  onPressed: () {
    // Aksi ketika button diklik
  },
),
```  

Kode ElevatedButton memiliki 2 parameter yaitu `onPressed` dan `child`. Parameter `onPressed` merupakan sebuah function event ketika tombol ditekan. Selain onPressed, ada juga event lain seperti `onLongPress` dan `onHighlightChanged`. Parameter kedua, yaitu `child`, diisi oleh widget pada umumnya.  

<p align="center">
<img src= "https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.1.1%20-%20ElevatedButton.jpeg" alt="Elevated Button" style="height: 600px;"/>  
</p>

## TextButton
TextButton merupakan widget button yang memiliki tampilan yang polos selayaknya Text. TextButton umumnya digunakan pada toolbars, dialog, atau bersama komponen button lain. Contoh kode dari TextButton adalah seperti berikut:  

```dart
TextButton(
  child: const Text('Text Button'),
  onPressed: () {
    // Aksi ketika button diklik
  },
),
```  

Seperti ElevatedButton, TextButton juga memiliki parameter onPressed dan child.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.1.2%20-%20TextButton.jpeg" alt="Text Button" style="height: 600px;"/>  
</p>

## OutlinedButton  
OutlinedButton juga merupakan bagian dari material design yang menyediakan tampilan TextButton dengan tambahan garis tepi. OutlinedButton sering digunakan untuk tombol atau aksi yang penting, tetapi bukan aksi utama dalam aplikasi.  
Berikut ini adalah contoh kode dari widget OutlinedButton:  

```dart
OutlinedButton(
  child: const Text('Outlined Button'),
  onPressed: () {
    // Aksi ketika button diklik
  },
),
```  

Tampilan OutlinedButton adalah seperti berikut:  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.1.3%20-%20OutlinedButton.jpeg" alt="Outlined Button" style="height: 600px;"/>  
</p>  

## IconButton
IconButton merupakan widget button dengan icon. Tidak seperti widget button/tombol lainnya, widget IconButton ini tidak memiliki child. Perhatikan kode di bawah ini:  

```dart
IconButton(
  icon: const Icon(Icons.volume_up),
  tooltip: 'Increase volume by 10',
  onPressed: () {
    // Aksi ketika button diklik
  },
),
```  

Dari kode tersebut, terlihat bahwa IconButton tidak menggunakan child untuk isi (_content_) melainkan menggunakan parameter icon dan _tooltip_ (penunjuk) untuk memberikan hint pada tombol.  

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.1.4%20-%20IconButton.jpeg" alt="Icon Button" style="height: 600px;"/>  
</p>  

## DropdownButton  
DropdownButton merupakan tombol yang saat diklik, akan muncul pop-up daftar item-item yang dapat kita pilih salah satu. Contoh kode dapat dilihat pada bagian di bawah ini:  

```dart
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
 
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
 
class _FirstScreenState extends State<FirstScreen> {
  String? language;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: DropdownButton<String>(
        items: const <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(
            value: 'Dart',
            child: Text('Dart'),
          ),
          DropdownMenuItem<String>(
            value: 'Kotlin',
            child: Text('Kotlin'),
          ),
          DropdownMenuItem<String>(
            value: 'Swift',
            child: Text('Swift'),
          ),
        ],
        value: language,
        hint: const Text('Select Language'),
        onChanged: (String? value) {
          setState(() {
            language = value;
          });
        },
      ),
    );
  }
}
```  

Pada contoh kode di atas, DropdownButton tidak menggunakan child maupun children, akan tetapi menggunakan `items` yang berisi list dari widget `DropdownMenuItem`. Pada widget `DropdownMenuItem` terdapat `child` untuk setiap itemnya dan `value` yang ada pada DropdownMenuItem. `Value` tersebut berisi nilai dari tiap itemnya. Nantinya, akan dibutuhkan parameter `onChanged` ketika ada perubahan atau ketika memilih salah satu dari item tersebut dan mengubah nilai language atau value dari DropdownButton tersebut. Sedangkan `hint` berfungsi ketika nilai value dari DropdownButton null atau kosong.

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.1.5%20-%20DropdownButton.gif" alt="Dropdown Button" style="height: 600px;"/>  
</p>  

## Referensi
-   [Button Material Components](https://flutter.dev/docs/development/ui/widgets/material#Buttons)
-   [ElevatedButton Class](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)
-   [TextButton Class](https://api.flutter.dev/flutter/material/TextButton-class.html)
-   [OutlinedButton](https://api.flutter.dev/flutter/material/OutlinedButton-class.html)
-   [IconButton Class](https://api.flutter.dev/flutter/material/IconButton-class.html)
-   [DropdownButton Class](https://api.flutter.dev/flutter/material/DropdownButton-class.html)

## Navigasi
 - Silabus: [Kembali ke Silabus](https://github.com/alfikiafan/ITCLUB-Android-Dev)
 - Materi Setelahnya: [Input Widget](https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/2%20-%20Input%20Widget.md) 
