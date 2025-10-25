
part of 'shop_bloc.dart';


class ShopState extends Equatable {
  final String? message;
  final Status status;
  final Status campaignStatus;
  final Status categoryStatus;
  final Status subCategoriesStatus;
  final Status ctgProductsStatus;
  final Status newestProductsStatus;
  final Status popularProductsStatus;
  final Status bestProductsStatus;
  final Status discountsProductsStatus;
  final Status productsPaginationStatus;
  final Status newestProductsPaginationStatus;
  final Status ctgProductsPaginationStatus;
  final Status popularPaginationStatus;
  final Status bestPaginationStatus;
  final Status discountsPaginationStatus;
  final CategoriesEntity? categoriesEntity;
  final SubCategoriesEntity? subCategoriesEntity;
  final ProductsEntity? productsEntity;
  final List<Product>? products;
  final List<Product>? newestProducts;
  final List<Product>? ctgBaseProducts;
  final List<Product>? popularProducts;
  final List<Product>? bestSellingProducts;
  final List<Product>? discountsProducts;
  final CampaignsEntity? campaignsEntity;

  const ShopState({
    required this.message,
    required this.status,
    required this.campaignStatus,
    required this.categoryStatus,
    required this.subCategoriesStatus,
    required this.ctgProductsStatus,
    required this.newestProductsStatus,
    required this.popularProductsStatus,
    required this.bestProductsStatus,
    required this.discountsProductsStatus,
    required this.productsPaginationStatus,
    required this.newestProductsPaginationStatus,
    required this.ctgProductsPaginationStatus,
    required this.popularPaginationStatus,
    required this.bestPaginationStatus,
    required this.discountsPaginationStatus,
    required this.categoriesEntity,
    required this.subCategoriesEntity,
    required this.productsEntity,
    required this.products,
    required this.newestProducts,
    required this.ctgBaseProducts,
    required this.popularProducts,
    required this.bestSellingProducts,
    required this.discountsProducts,
    required this.campaignsEntity,
  });

  /// Initial state factory
  factory ShopState.initial() => const ShopState(
    message: null,
    status: Status.initial,
    campaignStatus: Status.initial,
    categoryStatus: Status.initial,
    subCategoriesStatus: Status.initial,
    newestProductsStatus: Status.initial,
    ctgProductsStatus: Status.initial,
    popularProductsStatus: Status.initial,
    bestProductsStatus: Status.initial,
    discountsProductsStatus: Status.initial,
    productsPaginationStatus: Status.initial,
    newestProductsPaginationStatus: Status.initial,
    ctgProductsPaginationStatus: Status.initial,
    popularPaginationStatus: Status.initial,
    bestPaginationStatus: Status.initial,
    discountsPaginationStatus: Status.initial,
    categoriesEntity: null,
    subCategoriesEntity: null,
    productsEntity: null,
    products: null,
    newestProducts: null,
    ctgBaseProducts: null,
    popularProducts: null,
    bestSellingProducts: null,
    discountsProducts: null,
    campaignsEntity: null,
  );

  /// Copy with new values
  ShopState copyWith({
    String? message,
    Status? status,
    Status? campaignStatus,
    Status? categoryStatus,
    Status? subCategoriesStatus,
    Status? ctgProductsStatus,
    Status? newestProductsStatus,
    Status? popularProductsStatus,
    Status? bestProductsStatus,
    Status? discountsProductsStatus,
    Status? productsPaginationStatus,
    Status? newestProductsPaginationStatus,
    Status? ctgProductsPaginationStatus,
    Status? popularPaginationStatus,
    Status? bestPaginationStatus,
    Status? discountsPaginationStatus,
    CategoriesEntity? categoriesEntity,
    SubCategoriesEntity? subCategoriesEntity,
    ProductsEntity? productsEntity,
    List<Product>? products,
    List<Product>? newestProducts,
    List<Product>? ctgBaseProducts,
    List<Product>? popularProducts,
    List<Product>? bestSellingProducts,
    List<Product>? discountsProducts,
    CampaignsEntity? campaignsEntity,
  }) {
    return ShopState(
      message: message ?? this.message,
      status: status ?? this.status,
      campaignStatus: campaignStatus ?? this.campaignStatus,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      subCategoriesStatus: subCategoriesStatus ?? this.subCategoriesStatus,
      ctgProductsStatus: ctgProductsStatus ?? this.ctgProductsStatus,
      newestProductsStatus: newestProductsStatus ?? this.newestProductsStatus,
      popularProductsStatus: popularProductsStatus ?? this.popularProductsStatus,
      bestProductsStatus: bestProductsStatus ?? this.bestProductsStatus,
      newestProductsPaginationStatus: newestProductsPaginationStatus ?? this.newestProductsPaginationStatus,
      discountsProductsStatus: discountsProductsStatus ?? this.discountsProductsStatus,
      productsPaginationStatus: productsPaginationStatus ?? this.productsPaginationStatus,
      ctgProductsPaginationStatus: ctgProductsPaginationStatus ?? this.ctgProductsPaginationStatus,
      popularPaginationStatus: popularPaginationStatus ?? this.popularPaginationStatus,
      bestPaginationStatus: bestPaginationStatus ?? this.bestPaginationStatus,
      discountsPaginationStatus: discountsPaginationStatus ?? this.discountsPaginationStatus,
      categoriesEntity: categoriesEntity ?? this.categoriesEntity,
      subCategoriesEntity: subCategoriesEntity ?? this.subCategoriesEntity,
      productsEntity: productsEntity ?? this.productsEntity,
      products: products ?? this.products,
      newestProducts: newestProducts ?? this.newestProducts,
      ctgBaseProducts: ctgBaseProducts ?? this.ctgBaseProducts,
      popularProducts: popularProducts ?? this.popularProducts,
      bestSellingProducts: bestSellingProducts ?? this.bestSellingProducts,
      discountsProducts: discountsProducts ?? this.discountsProducts,
      campaignsEntity: campaignsEntity ?? this.campaignsEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    message,
    status,
    campaignStatus,
    categoryStatus,
    subCategoriesStatus,
    newestProductsStatus,
    ctgProductsStatus,
    popularProductsStatus,
    bestPaginationStatus,
    discountsProductsStatus,
    ctgProductsPaginationStatus,
    newestProductsPaginationStatus,
    popularPaginationStatus,
    bestPaginationStatus,
    discountsPaginationStatus,
    categoriesEntity,
    subCategoriesEntity,
    productsEntity,
    products,
    newestProducts,
    ctgBaseProducts,
    popularProducts,
    bestSellingProducts,
    discountsProducts,
    campaignsEntity
  ];

}


