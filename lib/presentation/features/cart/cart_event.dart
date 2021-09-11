// Home Screen Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/data/model/part_time_data_model/part_time_model_task_one.dart';
import 'package:openflutterecommerce/data/model/promo.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class CartLoadedEvent extends CartEvent {}

@immutable
class CartQuantityChangedEvent extends CartEvent {
  final CartItem item;
  final int newQuantity;

  CartQuantityChangedEvent({this.item, this.newQuantity});
}

@immutable
class CartRemoveFromCartEvent extends CartEvent {
  final CartItem item;

  CartRemoveFromCartEvent({this.item});
}

@immutable
class PartTimeRemoveFromCartEvent extends CartEvent {
  final Rs item;
  PartTimeRemoveFromCartEvent({this.item});
}

@immutable
class PartTimeQuantityChangedEvent extends CartEvent {
  final List<Rs> collections;
  final Rs item;
  final int quantity;
  final int newQuantity;

  PartTimeQuantityChangedEvent(
      {this.collections, this.item, this.quantity, this.newQuantity});
}


// @immutable
// class CartPartTimeTaskOneAppliedEvent extends CartEvent {
//   final List<Rs> collections;
//   final Rs rs;
//   final int quantity;
//
//   CartPartTimeTaskOneAppliedEvent(
//       {this.collections, this.rs, this.quantity});
// }

@immutable
class CartAddToFavsEvent extends CartEvent {
  final CartItem item;

  CartAddToFavsEvent({this.item});
}



@immutable
class CartPromoAppliedEvent extends CartEvent {
  final Promo promo;

  CartPromoAppliedEvent({this.promo});
}

@immutable
class CartPromoCodeAppliedEvent extends CartEvent {
  final String promoCode;

  CartPromoCodeAppliedEvent({this.promoCode});
}


@immutable
class CartShowPopupEvent extends CartEvent {}
