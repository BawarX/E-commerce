import 'package:dd/add_to_event.dart';
import 'package:dd/add_to_state.dart';
import 'package:dd/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
final List<Product>  _productList = [
      Product(id: 1, name: 'product 1', price: 12),
      Product(id: 2, name: 'product 2', price: 11),
      Product(id: 3, name: 'product 3', price: 122),
      Product(id: 4, name: 'product 4', price: 124),
      Product(id: 5, name: 'product 5', price: 125),
    ];
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(_productList)) {
    on<AddtoCart>(addTocart);
    on<RemoveFromCart>(removeFromCart);
   //on<UpdatedCart>(updateCart);
    on<IncrementItem>(incrementItem);
  }

  Future<void> addTocart(AddtoCart event, emit) async {
    
      final updatedCart = List<Product>.from(state.cartItems)
        ..add(event.product!);
       
      emit(CartState(updatedCart));
    
  }
  
  Future<void> removeFromCart(RemoveFromCart event,emit) async{
 final updatedCart = List<Product>.from(state.cartItems)..remove(event.product);
     emit(CartState(updatedCart));
    
  }

  // Future<void> updateCart(CartEvent event,emit) async {
  //   if(event is UpdatedCart){
  //       final updatedCart = List<Product>.from(state.cartItems);
  //     final index = updatedCart.indexWhere((product) => product.id == event.updatedCart!.id);
  //     emit(CartState(updatedCart));
  //   }
  // }
    Future<void> incrementItem(IncrementItem event, Emitter<CartState> emit) async {
  
    final updatedCart = List<Product>.from(state.cartItems);
    final index = updatedCart.indexWhere((product) => product.id == event.updatedCart!.id);
    if (index != -1) {
      final productToUpdate = updatedCart[index];
      productToUpdate.quantity++;
    }
    emit(CartState(updatedCart));
 
}
  
}
