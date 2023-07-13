part of 'wishlist_bloc_bloc.dart';

@immutable
abstract class WishlistBlocState {}

abstract class WishListActionState extends WishlistBlocState {}

class WishlistBlocInitial extends WishlistBlocState {}

class WishListLoadingState extends WishlistBlocState {}

class WishListLoadSuccessState extends WishlistBlocState {
  final List<GroceryModel> wishListItems;

  WishListLoadSuccessState({required this.wishListItems});
}

class WishListLoadingErrorState extends WishlistBlocState {}
