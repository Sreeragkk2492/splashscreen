import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:splashscreen/statemanagement/using%20single%20provider/controller/controllerprovider.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      create: (context) => Counterprovider(),
      child: Couterscreen(),
    ),
  ));
}

class Couterscreen extends StatelessWidget {
  const Couterscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var counterprovider = Provider.of<Counterprovider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('counter app'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'press button to increment value',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'count:${counterprovider.counter.count}',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  counterprovider.increment();
                },
                child: Text("click here")),
                  ElevatedButton(
                onPressed: () {
                  counterprovider.decrement();
                },
                child: Text("click here to decrease")),
          ],
        ),
      ),
    );
  }
}
