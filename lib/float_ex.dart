import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Floatex(),
  ));
}

class Floatex extends StatelessWidget {
  const Floatex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("floatingActionButton,AlertDialog\nSnakbar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("floating action button"),
                    content: Text("Alert"),
                    actions: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("item added"),
                              
                              backgroundColor: Colors.black,
                            ));
                          },
                          icon: Icon(Icons.add)),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("item deleted")));
                          },
                          icon: Icon(Icons.minimize_outlined)),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.dangerous_outlined))
                    ],
                  ));
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
