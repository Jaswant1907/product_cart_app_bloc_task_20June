import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/product_bloc/product_event.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/product_bloc/product_state.dart';
import 'package:product_cart_app_bloc_task_23j/database/api/api.dart';
import 'package:product_cart_app_bloc_task_23j/model/product_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<Product> _allItem = [];

  ProductBloc() : super(ProductLoadingState()) {
    on<LoadProductEvent>(getData);
    on<SearchProductEvent>(serachData);
  }

  getData(LoadProductEvent event, Emitter<ProductState> emit) async {
    final resp = await Api().getAllItem();
    ProductModel productModel = ProductModel.fromJson(resp);
    _allItem = productModel.products!;
    emit(ProductLoadedState(products: _allItem));
  }

  serachData(SearchProductEvent event, Emitter<ProductState> emit) {
    final query = event.query.toLowerCase();

    final filterItem =
        _allItem
            .where((item) => item.title!.toLowerCase().contains(query))
            .toList();

    emit(ProductSearchState(_allItem, filterList: filterItem));
  }
}
