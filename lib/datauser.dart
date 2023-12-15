import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/resep_minuman.dart';
import 'package:flutter_application_1/viewmodels/fetch_data_resepminuman.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final firebase_auth.FirebaseAuth _auth =
      firebase_auth.FirebaseAuth.instance; // Use the prefix
  final TextEditingController namaController = TextEditingController();
  final TextEditingController noTlpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Repository repo = Repository();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pengguna'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: noTlpController,
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final myUser = MyUser(
                  // Use the User model from your local code
                  nama: namaController.text,
                  email: _auth.currentUser?.email ?? "", // User's email address
                  noTlp: noTlpController.text,
                );

                future:
                repo.addUser(myUser);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBottomNavBar()),
                );
              },
              child: Text('Simpan Pengguna'),
            ),
          ],
        ),
      ),
    );
  }
}
