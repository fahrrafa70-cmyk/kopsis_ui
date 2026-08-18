import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /* 
      Antarmuka dibuat bertingkat (induk–anak) agar posisi dan tata letak widget 
      bisa teratur dengan rapi, di mana widget anak mengikuti aturan dari induknya. 
      Jika semua bagian ditulis sejajar tanpa hierarki, Flutter tidak akan tahu 
      bagaimana membagi ruang layar, sehingga tampilan akan saling bertumpuk 
      dan kodenya menjadi sangat berantakan.
    */
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: const Center(child: Text('Kasir Koperasi')),
      ),
    );
  }
}