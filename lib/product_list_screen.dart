
import 'package:dd/add_to_cart.dart';
import 'package:dd/add_to_event.dart';
import 'package:dd/add_to_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int num = 4;
     final cartBloc = BlocProvider.of<CartBloc>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('hi'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartItem');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return Card(
            child: ListTile(

              title: Text(productList[index].name),
              subtitle: Column(
                children: [
                   Text('\$${productList[index].price}'),
                   Row(
                    children: [
                      IconButton(onPressed: (){        
                      },
                       icon: const Icon(Icons.remove)),
                       Container(
                        width: 50,
                        height: 30,
                        color: Colors.grey,
                        child: BlocBuilder<CartBloc,CartState>(
                          builder: (context,state){
                            return Text("${productList[index].quantity}");
                          },
                        ),
                       ),
                        IconButton(onPressed: (){
                            cartBloc.add(IncrementItem());
                            print(cartBloc.state);
                      },
                       icon: const Icon(Icons.add)),
                    ],
                   ),
                ],
              ),
             
              trailing: IconButton(
                onPressed: () {
                  final cartBloc = context.read<CartBloc>();
                  cartBloc.add(AddtoCart(product));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("item ADDED"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart_outlined),
              ),
            ),
          );
        },
      ),
    );
  }
}