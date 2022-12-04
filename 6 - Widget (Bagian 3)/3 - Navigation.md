# Navigation
Kita telah bisa membuat satu tampilan screen (layar/page) pada pembelajaran sebelumnya. Namun, pada saat membangun sebuah aplikasi kita akan membuat banyak sekali screen dan kita akan berpindah dari satu screen ke screen lainnya.

Dalam pemrograman Android kita mengenal Intent lalu pada pemrograman website terdapat tag untuk berpindah dari satu page ke page lain. Pada Flutter kita akan menggunakan sebuah class bernama Navigator. Dengan Navigator ini kita akan berpindah dari satu screen ke screen lainnya. Berikut ini contohnya:

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/assets/6.3.1%20Navigator.gif" alt="Navigator" style="height: 600px;"/>  
</p>  

Perlu kita ketahui bahwa konsep navigasi pada Flutter mirip sekali dengan pemrograman Android, yakni bahwa ketika berpindah screen/activity akan menjadi tumpukan (stack). Jadi ketika berpindah dari satu screen ke screen lain (push), maka screen pertama akan ditumpuk oleh screen kedua. Kemudian apabila kembali dari screen kedua ke pertama, maka screen kedua akan dihapus (pop).

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/assets/6.3.2%20Stack.png" alt="Stack and Push" style="height: 400px;"/>  
</p>  

Kita akan membuat kode seperti contoh di atas. Kita membutuhkan halaman kedua yang kodenya seperti berikut:

```dart
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: OutlinedButton(
          child: const Text('Kembali'),
          onPressed: () {},
        ),
      ),
    );
  }
}
```  
Lalu, kode untuk halaman pertama akan seperti berikut:

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
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {},
        ),
      ),
    );
  }
}
```  

## Navigator.push
Untuk berpindah ke screen kedua kita akan menggunakan sebuah method `Navigator.push`, method tersebut ditulis seperti berikut:  
```dart
Navigator.push(context, MaterialPageRoute(builder: (context) {
   return WidgetScreen();
}));
```  

Pada kode di atas `Navigator.push` memiliki dua parameter. Pertama ialah context dan yang kedua Route. Parameter context ini merupakan variabel BuildContext yang ada pada method build. Parameter route berguna untuk menentukan tujuan ke mana kita akan berpindah screen. Route tersebut kita isikan dengan MaterialPageRoute yang di dalamnya terdapat builder yang nantinya akan diisi dengan tujuan screen-nya. Maka untuk melakukan perpindahan screen kita akan membuat event `onPressed` pada tombol ElevatedButton yang ada pada screen pertama:

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
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SecondScreen();
            }));
          },
        ),
      ),
    );
  }
}
```  

## Navigator.pop
Setelah dapat berpindah ke screen lain maka kita akan belajar menggunakan `Navigator.pop` untuk kembali ke screen sebelumnya. Penulisan `Navigator.pop` seperti berikut.

```dart
Navigator.pop(context)
```  

Pada `Navigator.pop` kita hanya cukup menambahkan parameter context yang merupakan variabel dari method build.

Untuk kembali dari screen kedua kita dapat menambahkan event `onPressed` pada OutlinedButton yang ada pada screen kedua dan kita masukkan `Navigator.pop` pada event, seperti berikut:  

```dart
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: OutlinedButton(
          child: const Text('Kembali'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
```  

## Mengirimkan Data Antarhalaman
Seringkali beberapa halaman pada aplikasi perlu saling berinteraksi dengan berbagi dan saling mengirimkan data. Pada Flutter kita memanfaatkan constructor dari sebuah class untuk mengirimkan data antar halaman.

Sebagai contoh kita memiliki pesan yang akan dikirimkan dari First Screen menuju Second Screen.

```dart
final String message = 'Hello from First Screen!';
```

Untuk mengirimkan variabel message tersebut ke Second Screen, maka kita akan mengirimkannya sebagai parameter dari constructor kelas SecondScreen seperti berikut:

```dart
class FirstScreen extends StatelessWidget {
  final String message = 'Hello from First Screen!';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen(message)));
          },
        ),
      ),
    );
  }
}
```  

Agar Second Screen bisa menerima data tersebut, maka kita perlu mengubah default constructor-nya dan menambahkan variabel untuk menampung datanya.

```dart
class SecondScreen extends StatelessWidget {
  final String message;
 
  const SecondScreen(this.message, {Key? key}) : super(key: key);
}
```  

Kemudian kita dapat menampilkan data yang diterima melalui variabel yang kita buat.

```dart
class SecondScreen extends StatelessWidget {
  final String message;
 
  const SecondScreen(this.message, {Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            OutlinedButton(
              child: const Text('Kembali'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
```  

Sehingga tampilan Second Screen akan menampilkan pesan dari First Screen seperti berikut:

<p align="center">
<img src="https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/assets/6.3.3%20Send%20Data.png" alt="Send Data to Another Page" style="height: 600px;"/>  
</p>  

## Referensi
-   [Navigation Cookbook](https://flutter.dev/docs/cookbook/navigation)

## Navigasi
- Silabus: [Kembali ke Silabus](https://github.com/alfikiafan/ITCLUB-Android-Dev)
- Materi Sebelumnya: [Expanded & Flexible](https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/2%20-%20Expanded%20%26%20Flexible.md) 
- Materi Setelahnya: [Responsive Layout](https://github.com/alfikiafan/ITCLUB-Android-Dev/blob/main/6%20-%20Widget%20(Bagian%203)/4%20-%20Responsive%20Layout.md) 
