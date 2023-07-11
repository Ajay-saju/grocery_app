import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bussiness_logic/bloc/home_bloc/home_bloc_bloc.dart';
import 'package:grocery_app/presentation_layer/cart_screen/cart_screen.dart';
import 'package:grocery_app/presentation_layer/wishlist_screen/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBlocBloc homeBloc = HomeBlocBloc();
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) => current is! HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => const WishListscreen()));
        }
      },
      builder: (context, state) {
        print("-----------------------${state.runtimeType}");
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishListButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_rounded),
                  )
                ],
                title: const Text('Grocery app'),
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(successState
                                      .groceryModel[index].imageUrl))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          successState.groceryModel[index].name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(successState.groceryModel[index].description),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " \$ ${successState.groceryModel[index].price.toString()}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // homeBloc.add(HomeProductWishListButtonNavigateEvent());
                                  },
                                  icon:
                                      const Icon(Icons.favorite_border_rounded),
                                ),
                                IconButton(
                                    onPressed: () {
                                      // homeBloc.add(HomeProductCartButtonNavigateEvent());
                                    },
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: successState.groceryModel.length,
              ),
            );
          case HomeLoadedErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error loading'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
