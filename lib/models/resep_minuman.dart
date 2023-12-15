// To parse this JSON data, do
//
//     final resepMinuman = resepMinumanFromJson(jsonString);

import 'dart:convert';

ResepMinuman resepMinumanFromJson(String str) =>
    ResepMinuman.fromJson(json.decode(str));

String resepMinumanToJson(ResepMinuman data) => json.encode(data.toJson());

class ResepMinuman {
  final String bahan;
  final String kategori;
  final String nama;
  final String resep;
  final String url;

  ResepMinuman({
    required this.bahan,
    required this.kategori,
    required this.nama,
    required this.resep,
    required this.url,
  });

  factory ResepMinuman.fromJson(Map<String, dynamic> json) => ResepMinuman(
        bahan: json["Bahan"],
        kategori: json["Kategori"],
        nama: json["Nama"],
        resep: json["Resep"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "Bahan": bahan,
        "Kategori": kategori,
        "Nama": nama,
        "Resep": resep,
        "url": url,
      };
}

class MyUser {
  String? idUser;
  String? nama;
  String? email;
  String? noTlp;

  MyUser({
    this.idUser,
    this.nama,
    this.email,
    this.noTlp,
  });

  MyUser.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser']; // Change this to 'idUser'
    nama = json['nama'];
    email = json['email'];
    noTlp = json['noTlp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser'] = this.idUser; // Change this to 'idUser'
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['noTlp'] = this.noTlp;
    return data;
  }
}
