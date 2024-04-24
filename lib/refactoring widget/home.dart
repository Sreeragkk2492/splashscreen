import 'package:flutter/material.dart';
import 'package:splashscreen/refactoring%20widget/widgets/mywidget.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RefactoringHome(),
  ));
}

class RefactoringHome extends StatelessWidget {
  const RefactoringHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('refactoring widget'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
          itemCount: 10,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, int) => ProductWidget(
              onclick: () {
                print('card clicked');
              },
              bgcolor: Colors.grey,
              myimage: AssetImage('assets/images/blue.jpg'),
              productname: 'wall painting',
              price: '\$75')),
    );
  }
}
