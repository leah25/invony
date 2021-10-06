import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:invony/models/product_model.dart';
import 'package:invony/models/users_model.dart';

class ApiCall extends ChangeNotifier {
  List<User> _users = [];

  List<User> get usersList {
    return [..._users];
  }

  List<Product> _productList = [];

  List<Product> get productList {
    return [..._productList];
  }

  Future<void> getAppUsers() async {
    final url = Uri.parse('https://fakestoreapi.com/users');

    final response = await http.get(url);

    final responseData = json.decode(response.body) as List;

    List<User> allUsers = [];

    for (var item in responseData) {
      allUsers
          .add(User(name: item['username'], isSelected: false, id: item['id']));

      _users = allUsers;
    }

    notifyListeners();
  }

  Future<void> getProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');

    final response = await http.get(url);

    final responseData = json.decode(response.body) as List;

    List<Product> allProducts = [];

    for (var item in responseData) {
      allProducts.add(Product(
        id: item['id'],
        imageUrl: item['image'],
        category: item['category'],
        price: item['price'].toString(),
        description: item['description'],
        name: item['title'],
      ));
      _productList = allProducts;
    }

    notifyListeners();
  }

  List<Product> elevenToFifteenProducts() {
    final secondProducts = _productList.skip(10).take(5).toList();
    notifyListeners();
    return secondProducts;
  }

  List<Product> sixteenToTwentyProducts() {
    final secondProducts = _productList.skip(15).take(5).toList();
    notifyListeners();
    return secondProducts;
  }
}
