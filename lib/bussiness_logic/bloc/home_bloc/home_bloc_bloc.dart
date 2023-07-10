import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeProductWishListButtonClickedEvent>(homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishListButtonNavigateEvent>(homeProductWishListButtonNavigateEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print('wish list button click');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
     print('cart button click');
  }

  FutureOr<void> homeProductWishListButtonNavigateEvent(HomeProductWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
     print('wish list navigate button click');
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
     print('cart navigate button click');
  }
}
