import 'package:flutter/material.dart';
import 'package:splashscreen/passing%20data%20between%20screens/using%20naavigator/dummy_data.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// to read from previous page
    final productId = ModalRoute.of(context)?.settings.arguments;

    ///fetch that single map corresponding to the above id
    final product =
        products.firstWhere((element) => element['id'] == productId);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Product details',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(product['image'].toString()))),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              product['name'].toString(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              product['price'].toString(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              product['description'].toString(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              product['rating'].toString(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
