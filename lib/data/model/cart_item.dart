import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/product_attribute.dart';

import 'product.dart';

class CartItem extends Equatable {
  final Product product;
  final HashMap<ProductAttribute, String> selectedAttributes;
  final ProductQuantity productQuantity;

  double get price => product.price;
  // double get price => productQuantity.quantity * product.price;

  CartItem({
    @required this.product,
    this.productQuantity,
    @required this.selectedAttributes,
  });

  void changeQuantity(int quantity) {
    productQuantity.changeQuantity(quantity);
  }

  @override
  List<Object> get props =>
      [product, selectedAttributes, productQuantity.quantity];
}

class ProductQuantity {
  int quantity;

  ProductQuantity._(this.quantity);
  factory ProductQuantity(int quantity)=>ProductQuantity._(quantity);

  void changeQuantity(int newQuantity) {
    quantity = newQuantity;
  }
}
