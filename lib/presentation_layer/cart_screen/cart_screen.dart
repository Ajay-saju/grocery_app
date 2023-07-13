import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bussiness_logic/bloc/cart_bloc/cart_bloc_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartBloc = CartBlocBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartBloc,
        buildWhen: (previous, current) => current is! CartActionState,
        listenWhen: (previous, current) => current is CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadingState:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case CartLoadSuccessState:
              final successState = state as CartLoadSuccessState;
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Cart'),
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
                                        .cartItems[index].imageUrl))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            successState.cartItems[index].name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(successState.cartItems[index].description),
                        ],
                      ),
                    );
                  },
                  itemCount: successState.cartItems.length,
                ),
              );
            case CartLoadErrorState:
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
  }
}
