import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatelessWidget {
  final String nama;
  final int hargaAnggota;
  final int stok;
  final String kategori;
  final bool sorot;

  const BarangCard({
    super.key,
    required this.nama,
    required this.hargaAnggota,
    required this.stok,
    required this.kategori,
    this.sorot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      color: sorot ? Colors.amber.shade100 : Colors.white,
      child: ListTile(
        leading: const Icon(Icons.inventory_2),
        title: Row(
          children: [
            Text(nama),
            const SizedBox(width: 8),
            Chip(
              label: Text(
                kategori,
                style: const TextStyle(fontSize: 10),
              ),
              padding: EdgeInsets.zero,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
        subtitle: Text('Anggota Rp $hargaAnggota'),
        // Mengirimkan stok dan hargaAnggota
        trailing: KeranjangItem(
          stok: stok,
          hargaAnggota: hargaAnggota,
        ),
      ),
    );
  }
}