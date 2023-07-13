import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/data/grocery_data.dart';
import 'package:grocery_app/data/models/cart_model.dart';
import 'package:grocery_app/data/models/grocery_model_class.dart';
import 'package:grocery_app/data/models/wishlist_model.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishListButtonNavigateEvent>(
        homeProductWishListButtonNavigateEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        groceryModel: Grocery.groceryList
            .map((e) => GroceryModel(
                name: e['name'],
                description: e['description'],
                imageUrl: e['imageUrl'],
                price: e['price']))
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print('wish list button click');
    //  i need to add a new item to the wish list .
    wishListItems.add(event.wishListItems);
    emit(HomeProductWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('cart button click');

    cartItems.add(event.cartItems);
    emit(HomeProductCartedActionState());
  }

  FutureOr<void> homeProductWishListButtonNavigateEvent(
      HomeProductWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    //  print('cart navigate button click');
    emit(HomeNavigateToCartPageActionState());
  }
}
