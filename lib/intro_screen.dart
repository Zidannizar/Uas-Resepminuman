import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import '../components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 237, 212, 1.000),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            //nama warung
            Text(
              "Resep Minuman",
              style: TextStyle(
                fontSize: 44,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 25),

            //image
            Center(
              child: Image.network(
                'https://th.bing.com/th/id/OIG.e1ME00Ye8AlpWtEkIvDK?pid=ImgGn', // Replace with your image URL
                width: MediaQuery.of(context).size.width *
                    0.8, // 80% dari lebar layar
                height: MediaQuery.of(context).size.height *
                    0.4, // 40% dari tinggi layar
                fit: BoxFit.contain, // Adjust the BoxFit property as needed
              ),
            ),

            const SizedBox(height: 25),

            //title
            Text(
              "Together with Drinks, Let's Create Beautiful Memories",
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),

            //subtitle
            Text(
              "Pilihlah Minuman yang menurutmu sangat di perlukan kebutuhanmu. Jangan dengarkan orang karena yang butuh tubuhmu bukan tubuh orang lain.",
              style: TextStyle(
                color: const Color.fromRGBO(125, 124, 124, 1.000),
                height: 2,
              ),
            ),

            const SizedBox(height: 25),

            //button start
            MyButton(
              text: "Get Started",
              onTap: () {
                //menu page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
