import 'package:dd/model.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddtoCart extends CartEvent {
  Product? product;
  AddtoCart(this.product);
  @override
  List<Object> get props => [product!];
}
class RemoveFromCart extends CartEvent {
  final Product product;

  RemoveFromCart(this.product);

  @override
  List<Object?> get props => [product];
}

class UpdatedCart extends CartEvent{
   Product? updatedCart;
   
   @override
   List<Object?> get props => [updatedCart];
}
class IncrementItem extends CartEvent{
   Product? updatedCart;
   
   @override
   List<Object?> get props => [updatedCart];
}