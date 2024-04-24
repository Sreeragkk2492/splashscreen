import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StaggeredGridview(),
  ));
}

class StaggeredGridview extends StatelessWidget {
  const StaggeredGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("staggered gridview"),
      ),
      body: StaggeredGrid.count(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 5,
        children: [
          StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 2,
              child: Container(
                color: Colors.amber.shade600,
                child: Image.asset("assets/images/image2.png"),
              )),
                  StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 3,
              child: Container(
                color: const Color.fromARGB(255, 0, 140, 255),
                child: Image.asset("assets/images/image2.png"),
              )),
                  StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 2,
              child: Container(
                color: const Color.fromARGB(255, 255, 0, 0),
                child: Image.asset("assets/images/image2.png"),
              )),
                StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 3,
              child: Container(
                color: const Color.fromARGB(255, 255, 0, 0),
                child: Image.asset("assets/images/image2.png"),
              )),  StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 2,
              child: Container(
                color: Color.fromARGB(255, 0, 255, 106),
                child: Image.asset("assets/images/image2.png"),
              )),
               StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 3,
              child: Container(
                color: Color.fromARGB(255, 0, 255, 106),
                child: Image.asset("assets/images/image2.png"),
              )),
               StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 2,
              child: Container(
                color: Color.fromARGB(255, 19, 27, 23),
                child: Image.asset("assets/images/image2.png"),
              )),
        ],
      ),
    );
  }
}
