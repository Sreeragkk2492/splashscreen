import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Staggered_grid(),
  ));
}

class Staggered_grid extends StatelessWidget {
  Staggered_grid({super.key});

  var ccount = [2, 2, 2, 2, 2, 2];
  var mcount = [3, 2, 2, 2, 3, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
              crossAxisCount: 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: List.generate(
                  6,
                  (index) => StaggeredGridTile.count(
                      crossAxisCellCount: ccount[index],
                      mainAxisCellCount: mcount[index],
                      child: Card(
                        color:  Colors.primaries[Random().nextInt(Colors.primaries.length)],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/wall.jpg'),
                            Text('login'),
                          ],
                        ),
                      )))),
        ),
      ),
    );
  }
}
