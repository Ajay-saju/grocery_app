import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/models/grocery_model_class.dart';
import 'package:grocery_app/data/models/wishlist_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<WishlistBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<WishListInitialEvent>(wishListInitialEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishlistBlocState> emit) async {
    emit(WishListLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(WishListLoadSuccessState(wishListItems: wishListItems));
  }
}
