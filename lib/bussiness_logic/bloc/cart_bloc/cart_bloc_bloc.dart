import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/data/models/cart_model.dart';
import 'package:grocery_app/data/models/grocery_model_class.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartBlocState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(CartLoadSuccessState(cartItems: cartItems));
  }
}
