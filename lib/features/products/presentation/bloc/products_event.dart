
import 'package:equatable/equatable.dart';

sealed class ProductsEvent extends Equatable{}


class GetProducts extends ProductsEvent{

  final Map<String, dynamic> queryParams;
  GetProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}

class GetMoreProducts extends ProductsEvent{

  final Map<String, dynamic> queryParams;
  GetMoreProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}





