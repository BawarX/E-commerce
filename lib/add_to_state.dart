
import 'package:dd/model.dart';
import 'package:equatable/equatable.dart';

class CartState  extends Equatable{
  final List<Product> cartItems;
  const CartState(this.cartItems);
  
  @override
  // TODO: implement props
  List<Object?> get props => [cartItems];
}
