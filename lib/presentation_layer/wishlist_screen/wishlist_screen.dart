import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bussiness_logic/bloc/wishlist_bloc/wishlist_bloc_bloc.dart';

class WishListscreen extends StatefulWidget {
  const WishListscreen({super.key});

  @override
  State<WishListscreen> createState() => _WishListscreenState();
}

class _WishListscreenState extends State<WishListscreen> {
  final wishListItemsBloc = WishlistBlocBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishListItemsBloc.add(WishListInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBlocBloc, WishlistBlocState>(
        bloc: wishListItemsBloc,
        buildWhen: (previous, current) => current is! WishListActionState,
        listenWhen: (previous, current) => current is WishListActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListLoadingState:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case WishListLoadSuccessState:
              final sucessState = state as WishListLoadSuccessState;
              return Scaffold(
                appBar: AppBar(
                  title: const Text('WishList'),
                ),
                body: ListView.builder(
                  itemBuilder: (ctx, index) {
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
                                    image: NetworkImage(sucessState
                                        .wishListItems[index].imageUrl))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            sucessState.wishListItems[index].name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(sucessState.wishListItems[index].description),
                        ],
                      ),
                    );
                  },
                  itemCount: sucessState.wishListItems.length,
                ),
              );
            case WishListLoadingErrorState:
              return const Scaffold(
                body: Center(
                  child: Text('Error loading'),
                ),
              );
            default:
              return const SizedBox();
          }
        },
        listener: (context, state) {});
    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text('WishList'),
    //   ),
    // );
  }
}
