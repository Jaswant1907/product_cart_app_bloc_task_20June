import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable{

}

class LoadProductEvent extends ProductEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class SearchProductEvent extends ProductEvent{

  final String query;

 SearchProductEvent(this.query);

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}