import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/statemanagement/usinggetx/controller/countcontroller.dart';

void main() {
  runApp(MaterialApp(
    home: GetCountMain(),
    debugShowCheckedModeBanner: false,
  ));
}

class GetCountMain extends StatelessWidget {
  const GetCountMain({super.key});

  @override
  Widget build(BuildContext context) {
    final Countcontr countcontroller = Get.put(Countcontr());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('get x count'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'counter using getx',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Obx(() => Text(
                  'count = ${countcontroller.count}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            ElevatedButton(
                onPressed: () {
                  countcontroller.increment();
                },
                child: Text("click here")),
            ElevatedButton(
                onPressed: () {
                  countcontroller.decrement();
                },
                child: Text("click here to decrease")),
          ],
        ),
      ),
    );
  }
}
