import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/cartusinggetx/controller/productcontroller.dart';
import 'package:badges/badges.dart' as badges;
import 'package:splashscreen/cartusinggetx/views/widget/productgridview.dart';

void main(List<String> args) {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Carmain(),
  ));
}

class Carmain extends StatelessWidget {
  final ProductContoller productContoller = Get.put(ProductContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(builder: controller.navigateToCartScreen));
          },
          child: badges.Badge(
            badgeContent:
                Obx(() => Text(productContoller.itemcount.value.toString())),
            child:const Icon(Icons.shopping_bag),
          ),
          ),
         body:ProductGridview(),
    );
  }
}
