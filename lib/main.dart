import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar Barang
    final List<Map<String, dynamic>> daftarBarang = [
      {'nama': 'Buku Tulis', 'kategori': 'ATK', 'anggota': 3000, 'umum': 3500, 'stok': 40},
      {'nama': 'Pulpen', 'kategori': 'ATK', 'anggota': 2500, 'umum': 3000, 'stok': 25},
      {'nama': 'Roti', 'kategori': 'Makanan', 'anggota': 5000, 'umum': 5500, 'stok': 15},
      {'nama': 'Susu Botol', 'kategori': 'Minuman', 'anggota': 4000, 'umum': 4500, 'stok': 0}, // Stok 0
      {'nama': 'Pensil 2B', 'kategori': 'ATK', 'anggota': 2000, 'umum': 2500, 'stok': 30},
      {'nama': 'Penggaris 30cm', 'kategori': 'ATK', 'anggota': 1500, 'umum': 2000, 'stok': 12},
      {'nama': 'Keripik Singkong', 'kategori': 'Makanan', 'anggota': 3500, 'umum': 4000, 'stok': 20},
      {'nama': 'Air Mineral', 'kategori': 'Minuman', 'anggota': 2500, 'umum': 3000, 'stok': 50},
      {'nama': 'Teh Kemasan', 'kategori': 'Minuman', 'anggota': 3000, 'umum': 3500, 'stok': 0}, // Stok 0
    ];

    // Filter barang yang stoknya > 0 
    final barangTersedia = daftarBarang.where((item) => item['stok'] > 0).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: ListView.builder(
          itemCount: barangTersedia.length,
          itemBuilder: (context, index) {
            final barang = barangTersedia[index];

            return Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(getCategoryIcon(barang['kategori'] ?? '')),
                title: Text(
                  barang['nama'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Anggota Rp ' + barang['anggota'].toString()),
                    Text('Umum Rp ' + barang['umum'].toString()),
                  ],
                ),
                trailing: Text(
                  'Stok ' + barang['stok'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
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