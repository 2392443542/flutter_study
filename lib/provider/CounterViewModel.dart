import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CounterViewModel extends ChangeNotifier {


  int _counter = 0;

  // CounterViewModel({this._counter});

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  int get counter => _counter;
}