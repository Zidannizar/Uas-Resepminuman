import 'package:flutter/material.dart';
import 'package:flutter_application_1/listkategori.dart';
import 'package:flutter_application_1/models/kategori.dart'; // Import model Kategori

class Kategori_page extends StatelessWidget {
  const Kategori_page({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom dalam grid
          crossAxisSpacing: 8.0, // Jarak antara kolom
          mainAxisSpacing: 8.0, // Jarak antara baris
        ),
        itemCount: kategoriList.length, // Jumlah item dalam grid
        itemBuilder: (BuildContext context, int index) {
          Kategori kategori = kategoriList[index];
          return InkWell(
            onTap: () {
              // Tambahkan navigasi ke halaman detail jika diperlukan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListKategoriPage(category: kategori.name),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons
                        .local_drink, // Ganti dengan ikon yang sesuai dengan kategori
                    size: 40.0,
                    color: kategori.color,
                  ),
                  Text(
                    kategori.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
