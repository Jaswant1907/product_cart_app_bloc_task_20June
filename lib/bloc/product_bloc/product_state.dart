import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:product_cart_app_bloc_task_23j/model/product_model.dart';

abstract class ProductState extends Equatable{}

class ProductLoadingState extends ProductState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState{

  final List<Product> products;

  ProductLoadedState({required this.products});



  @override
  // TODO: implement props
  List<Object?> get props =>[products];
}
class ProductSearchState extends ProductState{
  final List<Product> allList;
  final List<Product> filterList;

  ProductSearchState(this.allList, {required this.filterList});



  @override
  // TODO: implement props
  List<Object?> get props => [allList,filterList];

}



class ProductErrorState extends ProductState{

  final String errorMsg;

  ProductErrorState({required this.errorMsg});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMsg];
}