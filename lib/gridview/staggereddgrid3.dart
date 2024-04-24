import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    home: Staggeredgrid3(),
    debugShowCheckedModeBanner: false,
  ));
}

class Staggeredgrid3 extends StatelessWidget {
  const Staggeredgrid3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("staggeredgrid3"),
      ),
      body: StaggeredGrid.extent(
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        maxCrossAxisExtent: 120,
        children: [
          StaggeredGridTile.extent(
              crossAxisCellCount: 2,
              mainAxisExtent: 120,
              child: Card(
                color: Colors.blue,
                elevation: 10,
                shadowColor: Colors.blue,
                child: Image.asset("assets/images/image2.png"),
              )),
          StaggeredGridTile.extent(
            
              crossAxisCellCount: 2,
              mainAxisExtent: 120,
              child: Card(
                color: Colors.amberAccent,
                elevation: 10,
                shadowColor: Colors.blue,
                child: Image.asset("assets/images/image2.png"),
              )),
          StaggeredGridTile.extent(
              crossAxisCellCount: 2,
              mainAxisExtent: 120,
              child: Card(
                color: Colors.blueGrey,
                elevation: 10,
                shadowColor: Colors.blue,
                child: Image.asset("assets/images/image2.png"),
              )),
          StaggeredGridTile.extent(
              crossAxisCellCount: 4,
              mainAxisExtent: 120,
              child: Card(
                color: Colors.cyanAccent,
                elevation: 10,
                shadowColor: Colors.blue,
                child: Image.asset("assets/images/image2.png"),
              )),
        ],
      ),
    );
  }
}
