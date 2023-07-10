import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bussiness_logic/bloc/home_bloc/home_bloc_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBlocBloc homeBloc = HomeBlocBloc();
    return BlocConsumer<HomeBlocBloc, HomeState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){
                homeBloc.add(HomeProductWishListButtonNavigateEvent());
              },icon:const Icon(Icons.favorite_rounded),),
              IconButton(onPressed: (){
                homeBloc.add(HomeProductCartButtonNavigateEvent());
              },icon:const Icon(Icons.shopping_bag_rounded),)
            ],
            title: const Text('Grocery app'),
          ),
        );
      },
      bloc: homeBloc,
      // buildWhen:(previous, current) =>  ,
      // listenWhen:(previous, current)=> ,
    );
  }
}
