import 'package:dd/add_to_cart.dart';
import 'package:dd/add_to_event.dart';
import 'package:dd/add_to_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemScreen extends StatefulWidget {
  const CartItemScreen({super.key});

  @override
  State<CartItemScreen> createState() => _CartItemScreenState();
}

class _CartItemScreenState extends State<CartItemScreen> {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Cart Item"),
      ),
      body: BlocBuilder<CartBloc,CartState>(
        builder: (context,state){
          
          return ListView.builder(
          itemCount:state.cartItems.length,
          itemBuilder:(context, index) {
           
            return ListTile(
              title:  Text(state.cartItems[index].name),
              subtitle:  Text(state.cartItems[index].price.toString()),
              trailing: IconButton(onPressed: (){   
                final cartBloc = BlocProvider.of<CartBloc>(context);
                cartBloc.add(RemoveFromCart(state.cartItems[index]));
              },
               icon: const Icon(Icons.remove_shopping_cart_outlined)),
            );
          },
        );
        },
      ),
    );
    
  }
}