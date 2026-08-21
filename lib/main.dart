import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Data barang
    final List<Map<String, dynamic>> daftarBarang = [
      {
        'nama': 'Buku Tulis',
        'kategori': 'ATK',
        'anggota': 3000,
        'umum': 3500,
        'stok': 40,
      },
      {
        'nama': 'Pulpen',
        'kategori': 'ATK',
        'anggota': 2500,
        'umum': 3000,
        'stok': 25,
      },
      {
        'nama': 'Roti',
        'kategori': 'Makanan',
        'anggota': 5000,
        'umum': 5500,
        'stok': 15,
      },
      {
        'nama': 'Susu Botol',
        'kategori': 'Minuman',
        'anggota': 4000,
        'umum': 4500,
        'stok': 0,
      },
      {
        'nama': 'Pensil 2B',
        'kategori': 'ATK',
        'anggota': 2000,
        'umum': 2500,
        'stok': 30,
      },
      {
        'nama': 'Penggaris 30cm',
        'kategori': 'ATK',
        'anggota': 1500,
        'umum': 2000,
        'stok': 12,
      },
      {
        'nama': 'Keripik Singkong',
        'kategori': 'Makanan',
        'anggota': 3500,
        'umum': 4000,
        'stok': 20,
      },
      {
        'nama': 'Air Mineral',
        'kategori': 'Minuman',
        'anggota': 2500,
        'umum': 3000,
        'stok': 50,
      },
      {
        'nama': 'Teh Kemasan',
        'kategori': 'Minuman',
        'anggota': 3000,
        'umum': 3500,
        'stok': 0,
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        // Daftar otomatis
        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];
            final bool isHabis = barang['stok'] == 0;

            return Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(getCategoryIcon(barang['kategori'] ?? '')),
                title: Text(
                  barang['nama'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isHabis ? Colors.red : Colors.black,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Anggota Rp ' + barang['anggota'].toString()),
                    Text('Umum Rp ' + barang['umum'].toString()),
                  ],
                ),
                trailing: Text(
                  isHabis ? 'Stok Habis' : 'Stok ' + barang['stok'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isHabis ? Colors.red : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Ikon otomatis per kategori
IconData getCategoryIcon(String kategori) {
  switch (kategori.toLowerCase()) {
    case 'atk':
      return Icons.edit_note;
    case 'makanan':
      return Icons.fastfood;
    case 'minuman':
      return Icons.local_drink;
    default:
      return Icons.inventory_2;
  }
}
