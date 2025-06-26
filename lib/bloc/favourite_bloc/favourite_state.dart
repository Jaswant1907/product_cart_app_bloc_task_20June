import 'package:product_cart_app_bloc_task_23j/model/product_model.dart';

abstract class FavoriteState {}

class initState extends FavoriteState {}

class LoadState extends FavoriteState {
  final List<Product> favorite;

  LoadState({required this.favorite});
}
