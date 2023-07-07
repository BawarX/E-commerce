import 'package:equatable/equatable.dart';

class Product extends Equatable{
  int id;
  String name;
  double price;
  int quantity;
  Product({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 0,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props =>[id,name,price,quantity];
}