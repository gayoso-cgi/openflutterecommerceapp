// Home Screen Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/data/model/part_time_data_model/part_time_model_task_one.dart';
import 'package:openflutterecommerce/data/model/promo.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class CartInitialState extends CartState {}

@immutable
class CartLoadingState extends CartState {}

@immutable
class PartTimeTaskOneLoadedState extends CartState {
  final List<Rs> collections = [];

  PartTimeTaskOneLoadedState({
    List<Rs> collection,
  }) {
    this.collections.addAll(collection);
  }

  PartTimeTaskOneLoadedState copyWith({List<Rs> collect}) {
    this.collections.addAll(collect ?? this.collections);
    return PartTimeTaskOneLoadedState(
      collection: this.collections
    );
  }

  @override
  List<Object> get props => [collections];
}

@immutable
class CartLoadedState extends CartState {
  final List<CartItem> cartProducts;
  final List<Promo> promos;
  final bool showPromoPopup;
  final double totalPrice;
  final double calculatedPrice;
  final Promo appliedPromo;
  final List<Rs> collections;

  CartLoadedState(
      {@required this.showPromoPopup,
      @required this.promos,
      this.totalPrice,
      this.calculatedPrice,
      this.appliedPromo,
      this.collections,
      @required this.cartProducts});

  CartLoadedState copyWith(
      {List<CartItem> cartProducts,
      double totalPrice,
      List<Promo> promos,
      List<Rs> collections,
      Promo appliedPromo,
      double calculatedPrice,
      bool showPromoPopup}) {
    return CartLoadedState(
        collections: collections ?? this.collections,
        promos: promos ?? this.promos,
        cartProducts: cartProducts ?? this.cartProducts,
        totalPrice: totalPrice ?? this.totalPrice,
        calculatedPrice: calculatedPrice ?? this.calculatedPrice,
        appliedPromo: appliedPromo ?? this.appliedPromo,
        showPromoPopup: showPromoPopup ?? this.showPromoPopup);
  }

  @override
  List<Object> get props =>
      [totalPrice, cartProducts, appliedPromo, showPromoPopup];
}

@immutable
class CartErrorState extends CartState {}
