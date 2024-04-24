import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/cartusinggetx/controller/productcontroller.dart';
import 'package:splashscreen/cartusinggetx/views/widget/productgridview.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key});

  final ProductContoller controller = Get.put(ProductContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart screen',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body:  Column(
        children: [
          Expanded(child: ProductGridview()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               Obx(() => Text(controller.price.value.toString(),style: TextStyle(fontWeight: FontWeight.bold)))
              ],
            ),
          )
        ],
      ),
    );
  }
}