part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{
  
}
class HomeBlocInitial extends HomeState {}
class HomeLoadingState extends HomeState{}
class HomeLoadedSuccessState extends HomeState{}
class HomeLoadedErrorState extends HomeState{}
class HomeNavigateToWishListPageActionState extends HomeActionState{}
class HomeNavigateToCartPageActionState extends HomeActionState{}

