part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeProductWishListButtonClickedEvent extends HomeBlocEvent {}

class HomeProductCartButtonClickedEvent extends HomeBlocEvent {}

class HomeProductWishListButtonNavigateEvent extends HomeBlocEvent {}

class HomeProductCartButtonNavigateEvent extends HomeBlocEvent {}
