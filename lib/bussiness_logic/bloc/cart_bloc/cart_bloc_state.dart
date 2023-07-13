part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocState {}

abstract class CartActionState extends CartBlocState {}

class CartBlocInitial extends CartBlocState {}

class CartLoadSuccessState extends CartBlocState {
  final List<GroceryModel> cartItems;

  CartLoadSuccessState({required this.cartItems});
}

class CartLoadingState extends CartBlocState {}

class CartLoadErrorState extends CartBlocState {}
