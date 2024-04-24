import 'package:flutter/material.dart';
import 'package:splashscreen/statemanagement/using%20single%20provider/models/counter.dart';

class Counterprovider extends ChangeNotifier{
  final Counter _counter=Counter(count: 0);

  Counter get counter=>_counter;

  void increment(){
    _counter.count++;
    notifyListeners();
  }
  void decrement(){
    _counter.count--;
    notifyListeners();
  }
}