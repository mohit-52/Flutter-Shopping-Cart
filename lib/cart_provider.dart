import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/db_helper.dart';

import 'cart_model.dart';

class CartProvider with ChangeNotifier{

  int _counter = 0;
  int get counter => _counter;

  double _totalPrize = 0.0;
  double get totalPrize => _totalPrize;


  DBHelper db = DBHelper();
  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }



  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_prize', _totalPrize);
    notifyListeners();
  }

  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrize = prefs.getDouble('total_prize') ?? 0;
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    _setPrefsItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefsItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefsItems();
    return _counter;
  }


  void addTotalPrize( double productPrize) {
    _totalPrize = _totalPrize + productPrize;
    _setPrefsItems();
    notifyListeners();
  }

  void removeTotalPrize( double productPrize) {
    _totalPrize = _totalPrize - productPrize;
    _setPrefsItems();
    notifyListeners();
  }

  double getTotalPrize() {
    _getPrefsItems();
    return _totalPrize;
  }

}