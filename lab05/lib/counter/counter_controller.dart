import 'package:flutter/material.dart';
import 'counter_model.dart';
class CounterController with ChangeNotifier {
CounterController._();
static final _controller = CounterController._();
factory CounterController() {
return _controller;
}
void increment() {
CounterModel().counter = CounterModel().counter + 1;
notifyListeners();
}
void decrement() {
CounterModel().counter = CounterModel().counter - 1;
notifyListeners();
}
}