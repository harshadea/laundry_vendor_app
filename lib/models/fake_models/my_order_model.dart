import 'package:flutter/material.dart';

class FakeMyOrderModel {
  String name;
  String price;
  ImageProvider<Object> productImage;
  String dateText;
  String orderStatus;
  bool isOutOfStock;
  FakeMyOrderModel({
    required this.name,
    required this.price,
    required this.productImage,
    required this.dateText,
    required this.orderStatus,
    this.isOutOfStock = false,
  });
}
