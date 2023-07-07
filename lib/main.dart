import 'package:dd/add_to_cart.dart';
import 'package:dd/cart_item_screen.dart';
import 'package:dd/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MultiBlocProvider(
     
      providers: [BlocProvider(create: (context) => CartBloc(),),],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/' :(context) => const ProductListScreen(),
          '/cartItem': (context) => const CartItemScreen(),
        },
      ),
    );
  }
}