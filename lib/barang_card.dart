import 'package:flutter/material.dart';

class BarangCard extends StatelessWidget {
  final String nama;
  final int hargaAnggota;
  final int stok;
  final String kategori;

  const BarangCard({
    super.key,
    required this.nama,
    required this.hargaAnggota,
    required this.stok,
    required this.kategori,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.inventory_2),
        title: Text(nama),
        subtitle: Text('Anggota Rp ' + hargaAnggota.toString()),
        trailing: Text('Stok ' + stok.toString()),
      ),
    );
  }
}