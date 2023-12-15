import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/resep_minuman.dart';

class DetailScreen extends StatelessWidget {
  final ResepMinuman resepMinuman;

  DetailScreen({required this.resepMinuman});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resepMinuman.nama),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tambahkan gambar di atas teks bahan
            Image(
              image: NetworkImage(resepMinuman.url),
              width: double.infinity, // Lebar gambar
              height: 200.0, // Tinggi gambar
              fit: BoxFit.cover,
            ),

            SizedBox(height: 16.0),

            Text(
              'Bahan-bahan:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              resepMinuman.bahan,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Cara Membuat:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              resepMinuman.resep,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
