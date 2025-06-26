import 'package:product_cart_app_bloc_task_23j/model/product_model.dart';

abstract class FavoriteEvent {}

class FavoriteLoadEvent extends FavoriteEvent {}

class AddToFavorite extends FavoriteEvent {
  final Product product;

  AddToFavorite({required this.product});
}

class RemoveFavEvent extends FavoriteEvent {
  final Product product;

  RemoveFavEvent({required this.product});
}
