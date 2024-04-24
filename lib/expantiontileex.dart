import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Expantionex(),
    debugShowCheckedModeBanner: false,
  ));
}

class Expantionex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("expantion tile"),
      ),
      body: ListView(
        children: [
          ExpansionTile(
              title: Text("expantion tile1"),
              subtitle: Text("colors"),
              children: List.generate(
                  3,
                  (index) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.cyan,
                        ),
                      ))),
          ExpansionTile(
            trailing: Icon(Icons.downhill_skiing,color: Colors.blue,),
              title: Text("expantion tile2"),
              subtitle: Text("colors"),
              children: List.generate(
                  3,
                  (index) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.cyan,
                        ),
                      ))),
        ],
      ),
    );
  }
}
