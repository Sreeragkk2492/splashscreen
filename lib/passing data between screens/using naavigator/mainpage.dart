

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/passing%20data%20between%20screens/using%20naavigator/details.dart';
import 'package:splashscreen/passing%20data%20between%20screens/using%20naavigator/dummy_data.dart';


void main(List<String> args) {
  runApp(MaterialApp(
    routes: {
      'detailspage':(context)=>DetailsPage(),
    },
    debugShowCheckedModeBanner: false,
    home: Product_mainpage(),
  ));
}
class Product_mainpage extends StatelessWidget {
  const Product_mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Shopify',
              style: TextStyle(fontSize: 25,color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10, 
          crossAxisCount: 2,
          children: products
              .map((product) => InkWell(
                onTap: (){
                 Navigator.pushNamed(context,'detailspage',arguments: product['id'] );
                },
                child: Card(
                      child: Column(
                       
                        children: [
                          Expanded(
                              child:Image.asset(product['image'].toString()),
                              ),
                                  Text(product['name'].toString(),style: TextStyle(
                                    fontSize: 25,
                                  ),),
                                  Text(product['price'].toString()),
                        ],
                      ),
                    ),
              ))
              .toList(),
        ));
  }
}
