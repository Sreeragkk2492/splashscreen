import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/cartusinggetx/models/itemsdetails.dart';
import 'package:splashscreen/cartusinggetx/views/cartscreen.dart';
import 'package:splashscreen/cartusinggetx/views/widget/productgridview.dart';

class ProductContoller extends GetxController{
  RxList<Itemdetails> allproducts=product.obs;
  bool isitemlistscreen=true;
  bool iscartscreen=false;
  Rx<int> itemcount=0.obs;
  Rx<double> price=0.0.obs;

  
    Widget navigateToCartScreen(BuildContext context){
    iscartscreen = true;
    isitemlistscreen = false;
    calculatePrice();
    return CartScreen();
  }

  countAllItems(){
    itemcount.value = 0;
    for(var element in allproducts){
      itemcount.value += element.count;
    }
  }

  
  calculatePrice(){
    price.value = 0.0;
    for(var element in allproducts) {
      if(element.count > 0) {
        price.value = (double.parse(element.price.replaceAll("\$", '').trim())*element.count)+price.value;
      }
    }
    return price.value;
  }

  Future<bool> navigateToListItemScreen() async{
    controller.iscartscreen = false;
    controller.isitemlistscreen = true;
    return true;
  }

  void increase(int index){
    allproducts[index].count++;
    allproducts.refresh();
    countAllItems();
     calculatePrice();
  }

  void decrease(int index) {
    if (allproducts[index].count > 0) {
      allproducts[index].count--;
      allproducts.refresh();
      countAllItems();
       calculatePrice();
    }
  }

  void removeItem(){
    for(var item in allproducts)
      item.count = 0;
    allproducts.refresh();
    itemcount.value = 0;
     calculatePrice();
  }

  VoidCallback? isCheckOutButtonEnabled(){
    if(itemcount>0) return (){};
    return null;
  }
}