
import 'package:equatable/equatable.dart';

sealed class ProductsEvent extends Equatable{}


class GetProducts extends ProductsEvent{
  @override
  List<Object?> get props => [];
}


class GetMoreProducts extends ProductsEvent{
  @override
  List<Object?> get props => [];
}


class SearchProducts extends ProductsEvent{

  final Map<String, dynamic> queryParams;
  SearchProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}





