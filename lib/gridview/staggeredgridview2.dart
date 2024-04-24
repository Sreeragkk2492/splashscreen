import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    home: StaggeredGridview2(),
    debugShowCheckedModeBanner: false,
  ));
}

class StaggeredGridview2 extends StatelessWidget {
  const StaggeredGridview2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered gridview2"),
      ),
      body: StaggeredGrid.extent(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        maxCrossAxisExtent: 120,
        children: [
          StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Card(
                elevation: 10,
                shadowColor: Colors.blue,
                child: Image.asset("assets/images/image2.png"),
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 3,
              child: Card(
                elevation: 10,
                shadowColor: Colors.blue,
                child: Image.asset("assets/images/image2.png"),
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Card(
                elevation: 10,
                shadowColor: Colors.blue,
                child: Image.asset("assets/images/image2.png"),
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Card(
                elevation: 10,
                shadowColor: Colors.blue,
                child: Image.asset("assets/images/image2.png"),
              )),
        ],
      ),
    );
  }
}
