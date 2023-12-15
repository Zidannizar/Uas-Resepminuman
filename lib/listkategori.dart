import 'package:flutter/material.dart';
import 'package:flutter_application_1/detail_screen.dart';
import 'package:flutter_application_1/models/resep_minuman.dart';
import 'package:flutter_application_1/viewmodels/fetch_data_resepminuman.dart';

class ListKategoriPage extends StatefulWidget {
  final String category;

  const ListKategoriPage({Key? key, required this.category}) : super(key: key);

  @override
  State<ListKategoriPage> createState() => _ListKategoriPageState();
}

class _ListKategoriPageState extends State<ListKategoriPage> {
  List<ResepMinuman> resepMinumans = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      Repository repo = Repository();
      List<ResepMinuman> fetchedData =
          await repo.getResepbyKategori(this.widget.category);

      setState(() {
        resepMinumans = fetchedData;
      });
    } catch (e) {
      print("Error fetching data: $e");
      // You might want to show an error message to the user using a Flutter Toast or a SnackBar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 128, 0),
        title: Text(
          'Resep Minuman ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: resepMinumans.length,
        itemBuilder: (context, index) {
          ResepMinuman resepMinuman = resepMinumans[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(resepMinuman: resepMinumans[index]),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    imagee(resepMinuman.url),
                    SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 2),
                                Text(
                                  resepMinuman.nama,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 128, 0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    resepMinuman.bahan,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 30, 0, 0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  resepMinuman.resep,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container imagee(String imageUrl) {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
