
import 'package:equatable/equatable.dart';

sealed class ShopEvent extends Equatable{}

class InitialEvent extends ShopEvent{
  @override
  List<Object?> get props => [];
}

class GetCampaigns extends ShopEvent{
  @override
  List<Object?> get props => [];
}


class GetCategories extends ShopEvent{
  @override
  List<Object?> get props => [];
}

class GetSubCategories extends ShopEvent{
  final String categoryId;

  GetSubCategories({required this.categoryId});

  @override
  List<Object?> get props => [
    categoryId
  ];
}


class GetProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}

class GetMoreProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetMoreProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}



class GetNewestProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetNewestProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}

class GetMoreNewestProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetMoreNewestProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}





class GetCtgProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetCtgProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}

class GetMoreCtgProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetMoreCtgProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}


class GetPopularProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetPopularProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}

class GetMorePopularProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetMorePopularProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}



class GetBestProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetBestProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}

class GetMoreBestProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetMoreBestProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}



class GetDiscountsProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetDiscountsProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}


class GetMoreDiscountsProducts extends ShopEvent{

  final Map<String, dynamic> queryParams;
  GetMoreDiscountsProducts({required this.queryParams});

  @override
  List<Object?> get props => [
    queryParams
  ];

}

