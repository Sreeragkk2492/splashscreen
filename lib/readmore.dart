import 'package:flutter/material.dart';
import 'package:rich_readmore/rich_readmore.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ReadmoreEX(),
  ));
}

class ReadmoreEX extends StatelessWidget {
  const ReadmoreEX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("readmore"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RichReadMoreText.fromString(
              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              textStyle: TextStyle(color: Colors.purpleAccent),
              settings: LengthModeSettings(
                trimLength: 20,
                trimCollapsedText: 'readmore', 
                trimExpandedText: ' Collapse ',
                onPressReadMore: () {
                  /// specific method to be called on press to show more
                },
                onPressReadLess: () {
                  /// specific method to be called on press to show less
                },
                lessStyle: TextStyle(color: Colors.blue),
                moreStyle: TextStyle(color: Colors.blue),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            RichReadMoreText.fromString(
              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              textStyle: TextStyle(color: Colors.purpleAccent),
              settings: LengthModeSettings(
                trimLength: 20,
                trimCollapsedText: 'readmore', 
                trimExpandedText: ' Collapse ',
                onPressReadMore: () {
                  /// specific method to be called on press to show more
                },
                onPressReadLess: () {
                  /// specific method to be called on press to show less
                },
                lessStyle: TextStyle(color: Colors.blue),
                moreStyle: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
