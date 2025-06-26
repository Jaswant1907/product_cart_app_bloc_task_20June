import 'package:product_cart_app_bloc_task_23j/model/product_model.dart';

import '../../model/product_model.dart';

abstract class CartEvent {}

class AddItemToCart extends CartEvent {
  final Product product;
  final int quantity;

  AddItemToCart({required this.product, this.quantity = 1});
}

class RemoveItem extends CartEvent {
  final Product product;

  RemoveItem({required this.product});
}

class UpdateItem extends CartEvent {
  final Product product;
  final int quantity;

  UpdateItem({required this.product, required this.quantity});
}

class CountIncEvent extends CartEvent {
  final Product product;

  CountIncEvent({required this.product});
}

class CountDecEvent extends CartEvent {
  final Product product;

  CountDecEvent({required this.product});
}
