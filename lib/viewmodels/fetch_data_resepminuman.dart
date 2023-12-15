import 'dart:convert';
import 'package:flutter_application_1/models/resep_minuman.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Repository {
  final String apiUrl =
      "https://resepminuman-c03a6-default-rtdb.firebaseio.com/ResepMinuman.json";

  Future<List<ResepMinuman>> fecthDataPlaces() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<ResepMinuman> dataUser;
    if (response.statusCode == 200) {
      List<dynamic> listJson =
          json.decode(response.body)["-Nkd5tn4aqPvhzmJygzs"];
      dataUser = listJson.map((e) => ResepMinuman.fromJson(e)).toList();
      return dataUser;
    } else {
      throw Exception('Failed to load data profile');
    }
  }

  Future<void> addUser(MyUser user) async {
    try {
      // Convert MyUser object to JSON
      final Map<String, dynamic> userJson = user.toJson();

      // Send a POST request with the user data
      final Response response = await http.post(
        Uri.parse(
            "https://resepminuman-c03a6-default-rtdb.firebaseio.com/user.json"),
        body: json.encode(userJson),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('User added successfully.');
      } else {
        throw Exception('Failed to add user');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<MyUser> getUserByEmail(String email) async {
    try {
      Response response = await http.get(Uri.parse(
          "https://resepminuman-c03a6-default-rtdb.firebaseio.com/user.json"));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Cari user dengan email yang sesuai
        for (final key in data.keys) {
          final user = MyUser.fromJson(data[key]);
          user.idUser = key;

          if (user.email == email) {
            return user;
          }
        }

        throw Exception('User with email $email not found');
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<ResepMinuman>> getResepbyKategori(String category) async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<ResepMinuman> dataUser;
    if (response.statusCode == 200) {
      List<dynamic> listJson =
          json.decode(response.body)["-Nkd5tn4aqPvhzmJygzs"];

      // Filter the list based on the specified category
      List<dynamic> filteredList =
          listJson.where((e) => e["Kategori"] == category).toList();

      dataUser = filteredList.map((e) => ResepMinuman.fromJson(e)).toList();
      return dataUser;
    } else {
      throw Exception('Failed to load data profile');
    }
  }
}
