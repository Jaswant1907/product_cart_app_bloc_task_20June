import 'package:product_cart_app_bloc_task_23j/model/product_model.dart';

abstract class CartState {}

class CartLoadState extends CartState {}

class CartUpdatedState extends CartState {
  final Map<Product, int> items;

  CartUpdatedState(this.items);

  double get totalAmount {
    return items.entries.fold(
      0.0,
      (sum, entry) => sum + (entry.key.price ?? 0.0) * entry.value,
    );
  }
}

class updateItemCount extends CartState {}
