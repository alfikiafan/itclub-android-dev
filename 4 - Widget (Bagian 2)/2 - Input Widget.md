# Input Widget
Salah satu bentuk interaksi dengan _user_ adalah dengan menerima input atau masukan. Ada beberapa input widget yang bisa digunakan supaya pengguna bisa berinteraksi dengan aplikasi. Input pengguna ini berkaitan dengan _state_ yang sering berubah. Oleh karena itu, umumnya input widget ditempatkan di dalam `StatefulWidget`. Beberapa jenis input widget akan dibahas di bawah ini.  

## TextField
TextField adalah widget yang digunakan untuk menerima input berupa teks yang berasal dari keyboard. Ada beberapa cara yang bisa kita gunakan untuk mendapatkan nilai dari TextField. Salah satunya adalah melalui parameter `onChanged`.  

```dart
String _name = '';
 
TextField(
  onChanged: (String value) {
    setState(() {
      _name = value;
    });
  },
)
```  

Parameter onChanged berisi sebuah fungsi yang akan dipanggil setiap terjadi perubahan inputan pada TextField. Pada fungsi ini, kita bisa mengubah nilai variabel state dengan memanggil fungsi setState().

Jika teman-teman tidak ingin mengambil nilai setiap perubahan, tetapi hanya ketika seluruh input sudah selesai di-submit, kita bisa memakai parameter `onSubmitted` seperti ini:

```dart
String _name = '';
 
TextField(
  onSubmitted: (String value) {
    setState(() {
      _name = value;
    });
  },
)
```  

Cara lainnya adalah dengan `TextEditingController`. Dengan controller, kita hanya perlu membuat variabel `TextEditingController` lalu menambahkannya ke widget TextField.  

```dart
TextEditingController _controller = TextEditingController();
 
TextField(
  controller: _controller,
),
```  

Saat menggunakan controller, pastikan untuk menghapus controller ketika halaman atau widget sudah tidak digunakan supaya tidak menimbulkan kebocoran memori (_memory leak_).

```dart
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```  

<p align="center">
<img src= "https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.2.1%20TextField.gif" alt="Text Field" style="height: 600px;"/>  
</p>

Contoh penerapannya adalah seperti berikut ini.  

**Bagian onChanged**  
```dart
class _FirstScreenState extends State<FirstScreen> {
  String _name = '';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Write your name here...',
                labelText: 'Your Name',
              ),
              onChanged: (String value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Hello, $_name'),
                      );
                    });
              },
            )
          ],
        ),
      ),
```  

**Bagian Controller**  
```dart
class _FirstScreenState extends State<FirstScreen> {
  TextEditingController _controller = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Write your name here...',
                labelText: 'Your Name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Hello, ${_controller.text}'),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```  

## Switch
Switch merupakan widget input yang mengembalikan nilai boolean true atau false. Perhatikan contoh berikut:

```dart
class _FirstScreenState extends State<FirstScreen> {
  bool lightOn = false;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Switch(
        value: lightOn,
        onChanged: (bool value) {
          setState(() {
            lightOn = value;
          });
 
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(lightOn ? 'Light On' : 'Light Off'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
```  

<p align="center">
<img src= "https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.2.2%20Switch.gif" alt="Switch" style="height: 600px;"/>  
</p>  

## Radio
Radio merupakan widget input yang digunakan untuk memilih salah satu dari beberapa pilihan dalam suatu grup. Berikut contohnya:  
```dart
class _FirstScreenState extends State<FirstScreen> {
  String? language;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Radio<String>(
              value: 'Dart',
              groupValue: language,
              onChanged: (String? value) {
                setState(() {
                  language = value;
                  showSnackbar();
                });
              },
            ),
            title: Text('Dart'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Kotlin',
              groupValue: language,
              onChanged: (String? value) {
                setState(() {
                  language = value;
                  showSnackbar();
                });
              },
            ),
            title: Text('Kotlin'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Swift',
              groupValue: language,
              onChanged: (String? value) {
                setState(() {
                  language = value;
                  showSnackbar();
                });
              },
            ),
            title: Text('Swift'),
          ),
        ],
      ),
    );
  }
 
  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
```  

Pada contoh tersebut terdapat variable `language` yang digunakan pada `groupValue` tiap Radio. Language inilah yang menyimpan nilai Radio yang dipilih. Nilainya akan berubah ketika fungsi `onChanged` terpanggil.  

<p align="center">
<img src= "https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.2.3%20Radio.gif" alt="Radio" style="height: 600px;"/>  
</p>  

## Checkbox
Checkbox merupakan inputan benar atau salah. Checkbox akan berisi centang jika nilainya adalah benar dan kosong jika salah. Seperti pada contoh berikut:  

```dart
class _FirstScreenState extends State<FirstScreen> {
  bool agree = false;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: ListTile(
        leading: Checkbox(
          value: agree,
          onChanged: (bool? value) {
            setState(() {
              agree = value!;
            });
          },
        ),
        title: Text('Agree / Disagree'),
      ),
    );
  }
}
```  

Jika kode tersebut dijalankan, hasilnya adalah seperti ini:  

<p align="center">
<img src= "https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/assets/4.2.4%20Checkbox.png" alt="Chcekbox" style="height: 600px;"/>  
</p>  

## Referensi
-   [Input and selections widgets](https://flutter.dev/docs/development/ui/widgets/material#Input%20and%20selections)
-   [TextField Class](https://api.flutter.dev/flutter/material/TextField-class.html)
-   [Switch Class](https://api.flutter.dev/flutter/material/Switch-class.html)
-   [Radio Class](https://api.flutter.dev/flutter/material/Radio-class.html)
-   [Checkbox Class](https://api.flutter.dev/flutter/material/Checkbox-class.html)

## Navigasi
 - Silabus: [Kembali ke Silabus](https://github.com/alfikiafan/ITCLUB-Android-Dev)
 - Materi Sebelumnya: [Button](https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/1%20-%20Button.md)
 - Materi Setelahnya: [Image](https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/4%20-%20Widget%20(Bagian%202)/3%20-%20Image.md) 
