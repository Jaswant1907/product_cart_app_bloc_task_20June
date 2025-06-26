import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/favourite_bloc/favourite_event.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/favourite_bloc/favourite_state.dart';
import 'package:product_cart_app_bloc_task_23j/model/product_model.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  late List<Product> _favouritList = [];

  FavoriteBloc() : super(initState()) {
    on<AddToFavorite>(addToFavorite);
    on<RemoveFavEvent>(removeFromFavorite);
    on<FavoriteLoadEvent>(loadFavorite);
  }

  void addToFavorite(AddToFavorite event, Emitter<FavoriteState> emit) {
    final currentList = List<Product>.from(_favouritList);

    final alreadyAdded = currentList.any((p) => p.id == event.product.id);
    if (!alreadyAdded) {
      currentList.add(event.product);
    }

    _favouritList = currentList;
    emit(LoadState(favorite: currentList));
  }

  void removeFromFavorite(RemoveFavEvent event, Emitter<FavoriteState> emit) {
    final currentList = List<Product>.from(_favouritList);
    currentList.removeWhere((p) => p.id == event.product.id);

    _favouritList = currentList;
    emit(LoadState(favorite: currentList));
  }

  void loadFavorite(FavoriteLoadEvent event, Emitter<FavoriteState> emit) {
    emit(LoadState(favorite: List.from(_favouritList)));
  }
}
