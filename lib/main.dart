import 'package:flutter/material.dart';
import 'barang_card.dart';

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
      {'nama': 'Susu Botol', 'kategori': 'Minuman', 'anggota': 4000, 'umum': 4500, 'stok': 0},
      {'nama': 'Pensil 2B', 'kategori': 'ATK', 'anggota': 2000, 'umum': 2500, 'stok': 30},
      {'nama': 'Penggaris 30cm', 'kategori': 'ATK', 'anggota': 1500, 'umum': 2000, 'stok': 30},
      {'nama': 'Keripik Singkong', 'kategori': 'Makanan', 'anggota': 3500, 'umum': 4000, 'stok': 20},
      {'nama': 'Air Mineral', 'kategori': 'Minuman', 'anggota': 2500, 'umum': 3000, 'stok': 50},
      {'nama': 'Teh Kemasan', 'kategori': 'Minuman', 'anggota': 3000, 'umum': 3500, 'stok': 0},
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
            
            // Pemanggilan BarangCard sesuai parameter di barang_card.dart
            return BarangCard(
              nama: barang['nama'],
              hargaAnggota: barang['anggota'],
              stok: barang['stok'],
              kategori: barang['kategori'],
            );
          },
        ),
      ),
    );
  }
}