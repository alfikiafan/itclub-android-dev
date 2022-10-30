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

Contoh penerapannya adalah seperti berikut ini.
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
