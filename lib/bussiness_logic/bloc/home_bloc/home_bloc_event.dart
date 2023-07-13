part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeProductWishListButtonClickedEvent extends HomeBlocEvent {
  final GroceryModel wishListItems;

  HomeProductWishListButtonClickedEvent({required this.wishListItems});
}

class HomeProductCartButtonClickedEvent extends HomeBlocEvent {
  final GroceryModel cartItems;

  HomeProductCartButtonClickedEvent({required this.cartItems});
}

class HomeProductWishListButtonNavigateEvent extends HomeBlocEvent {}

class HomeProductCartButtonNavigateEvent extends HomeBlocEvent {}
