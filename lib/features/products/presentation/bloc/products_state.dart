
part of 'products_bloc.dart';


class ProductsState extends Equatable {
  final String? message;
  final Status status;
  final Status paginationStatus;
  final List<Product>? products;
  final ProductsEntity? productsEntity;

  const ProductsState({
    required this.message,
    required this.status,
    required this.paginationStatus,
    required this.products,
    required this.productsEntity,
  });

  /// Initial state factory
  factory ProductsState.initial() => const ProductsState(
    message: null,
    status: Status.initial,
    paginationStatus: Status.initial,
    productsEntity: null,
    products: null,
  );

  /// Copy with new values
  ProductsState copyWith({
    String? message,
    Status? status,
    Status? paginationStatus,
    List<Product>? products,
    ProductsEntity? productsEntity,
  }) {
    return ProductsState(
      message: message ?? this.message,
      status: status ?? this.status,
      paginationStatus: paginationStatus ?? this.paginationStatus,
      products: products ?? this.products,
      productsEntity: productsEntity ?? this.productsEntity,
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    message,
    status,
    products,
    paginationStatus,
    productsEntity
  ];

}


