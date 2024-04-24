import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Stackexample(),
  ));
}

class Stackexample extends StatelessWidget {
  const Stackexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my atm card"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: 300,
                width: 700,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/blue.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Positioned(
                  left: 12,
                  top: 10,
                  child: Text('Visa Platinum',
                      style: GoogleFonts.abel(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
              Positioned(
                top: 50,
                left: 12,
                child: Row(
                  children: [
                    Icon(
                      Icons.sim_card_alert_outlined,
                      color: Colors.grey,
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Transform.rotate(
                        angle: 90 * pi / 180,
                        child: Icon(
                          Icons.wifi,
                          color: Colors.grey,
                          size: 40,
                        )),
                  ],
                ),
              ),
              Positioned(
                  left: 20,
                  top: 110,
                  child: Text(
                    '4000  1187  2345  5641',
                    style: GoogleFonts.frederickaTheGreat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  left: 20,
                  bottom: 140,
                  child: Text(
                    '4000',
                    style: GoogleFonts.frederickaTheGreat(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              Positioned(
                left: 60,
                top: 190,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(
                          'GOOO',
                          style: GoogleFonts.scada(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'THRU',
                          style: GoogleFonts.scada(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '12/12',
                      style: GoogleFonts.scada(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Text(
                  'SREERAG KK',
                  style: GoogleFonts.frederickaTheGreat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Visa",
                      style: GoogleFonts.frederickaTheGreat(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('Platinum',style: GoogleFonts.kreon(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
