import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  final int stok;
  final int hargaAnggota;

  const KeranjangItem({
    super.key,
    required this.stok,
    required this.hargaAnggota,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    int totalHarga = widget.hargaAnggota * jumlah;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.remove, size: 20),
              onPressed: () {
                setState(() {
                  if (jumlah > 1) jumlah--;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(jumlah.toString()),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.add, size: 20),
              onPressed: () {
                setState(() {
                  if (jumlah < widget.stok) {
                    jumlah++;
                  } else {
                    print('Jumlah tidak boleh melebihi stok!');
                  }
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          'Total: Rp $totalHarga',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}