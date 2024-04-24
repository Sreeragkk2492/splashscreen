import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/cartusinggetx/controller/productcontroller.dart';
import 'package:splashscreen/cartusinggetx/models/itemsdetails.dart';

final ProductContoller controller = Get.put(ProductContoller());

class ProductGridview extends StatelessWidget {
  Widget countButton(int index, void Function(int index) counter,
      {IconData? icon}) {
    return RawMaterialButton(
      onPressed: () {
        counter(index);
      },
      elevation: 10.0,
      fillColor: Colors.white,
      child: Icon(
        icon,
        size: 15,
      ),
      shape: CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget listViewBody(Itemdetails item, int index) {
      return GestureDetector(
        onTap: () {},
        child: Card(
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Image.asset(
                item.image,
                fit: BoxFit.contain,
                width: 60,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(),
                  ),
                  Text(
                    item.price,
                    style: TextStyle(),
                  ),
                  Text(
                    item.color,
                    style: TextStyle(),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  countButton(index, controller.increase, icon: Icons.add),
                  Obx(() =>
                      Text(controller.allproducts[index].count.toString())),
                  countButton(index, controller.decrease, icon: Icons.remove)
                ],
              )
            ],
          ),
        ),
      );
    }

    return ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: controller.allproducts.length,
        itemBuilder: (_, index) {
          Itemdetails item = controller.allproducts[index];
          if (controller.isitemlistscreen) {
            return listViewBody(item, index);
          } else if (controller.iscartscreen && item.count > 0) {
            return listViewBody(item, index);
          } else {
            return Container();
          }
        });
  }
}
