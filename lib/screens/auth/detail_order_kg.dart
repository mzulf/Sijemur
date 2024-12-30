import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOrderKg extends StatefulWidget {
  const DetailOrderKg({Key? key}) : super(key: key);

  @override
  _DetailOrderKgState createState() => _DetailOrderKgState();
}

class _DetailOrderKgState extends State<DetailOrderKg> {
  double weight = 0.0;
  final int pricePerKg = 20000; // Misalkan harga per kg adalah 20.000

  @override
  Widget build(BuildContext context) {
    int total = (weight * pricePerKg).round(); // Hitung total berdasarkan berat

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Detail Order KG'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Masukkan Jumlah KG',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  '$weight KG',
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pastikan Jumlah Berat Laundry Sudah Benar',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(height: 20),
                Text(
                  'Total Biaya: Rp. ${total.toString()},-',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  childAspectRatio: 1.5,
                  children: [
                    for (var i = 1; i <= 9; i++) _buildNumberButton(i.toString()),
                    _buildNumberButton('0'),
                    _buildNumberButton('.'),
                    _buildBackspaceButton(),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text('Batal', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigasi ke halaman pembayaran
                            Get.toNamed('/payment', arguments: {
                              'total': total,
                              'weight': weight,
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text('Konfirmasi', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (number == '.' && weight.toString().contains('.')) return; // Mencegah lebih dari 1 titik desimal
          weight = double.parse((weight.toString() + number).replaceAll(',', '.'));
        });
      },
      child: Text(number, style: const TextStyle(fontSize: 24, color: Colors.black)),
    );
  }

  Widget _buildBackspaceButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          if (weight == 0.0) return; // Tidak mengubah apa-apa jika berat 0
          String weightString = weight.toString();
          if (weightString.contains('.')) {
            // Jika ada angka desimal, hapus digit setelah desimal
            if (weightString.substring(weightString.indexOf('.') + 1).isNotEmpty) {
              weightString = weightString.substring(0, weightString.length - 1);
            } else {
              // Jika sudah tidak ada angka setelah titik, hapus titiknya
              weightString = weightString.substring(0, weightString.length - 1);
            }
          } else {
            // Jika tidak ada titik, hapus angka terakhir
            weightString = weightString.substring(0, weightString.length - 1);
          }
          weight = double.parse(weightString.isEmpty ? '0' : weightString);
        });
      },
      child: const Icon(Icons.backspace, color: Colors.black),
    );
  }
}
