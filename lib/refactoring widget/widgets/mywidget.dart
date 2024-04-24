import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatelessWidget {
  final ImageProvider myimage;
  final String productname;
  final String price;
  VoidCallback? onclick;
  Color? bgcolor;

  ProductWidget(
      {super.key,
      required this.myimage,
      required this.productname,
      required this.price,
      this.onclick,
      this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Card(
        color: bgcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: myimage,
              width: 100,
              height: 100,
            ),
            Text(
              productname,
              style:
                  GoogleFonts.habibi(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: GoogleFonts.abel(fontSize: 20),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min, 
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border), 
                        label: Text('')),
                  ),
                       Expanded(
                         child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                               onPressed: () {},
                                               icon: Icon(Icons.shopping_cart),
                                               label: Text('')),
                       ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
