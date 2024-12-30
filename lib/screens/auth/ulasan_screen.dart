import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UlasanScreen extends StatefulWidget {
  const UlasanScreen({Key? key}) : super(key: key);

  @override
  _UlasanScreenState createState() => _UlasanScreenState();
}

class _UlasanScreenState extends State<UlasanScreen> {
  double _rating = 0; // Untuk menyimpan rating bintang
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B795E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B795E),
        title: const Text('Ulasan', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Berikan Rating Anda',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildStarRating(), // Memanggil widget rating bintang
            const SizedBox(height: 30),
            const Text(
              'Komentar',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _commentController,
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Tulis komentar...',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rating > 0 ? () {
                // Handle send comment action
                Get.snackbar('Komentar Dikirim', 'Terima kasih atas ulasan Anda!',
                    backgroundColor: Colors.green,
                    colorText: Colors.white);
                // Resetting the form after submission
                setState(() {
                  _rating = 0;
                  _commentController.clear();
                });
              } : null, // Disable button if no rating
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B795E),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Kirim', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            _rating >= index + 1 ? Icons.star : Icons.star_border, // Mengatur ikon berdasarkan rating
            color: Colors.yellow,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1; // Mengatur rating bintang berdasarkan yang dipilih
            });
          },
        );
      }),
    );
  }
}
