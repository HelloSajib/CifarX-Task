import 'package:arafah/config/service_locator/service_locator.dart';
import 'package:arafah/core/utils/enums/enums.dart';
import 'package:arafah/features/shop/data/models/produts_model.dart';
import 'package:arafah/features/shop/domain/entities/campaigns_entity.dart';
import 'package:arafah/features/shop/domain/entities/categories_entity.dart';
import 'package:arafah/features/shop/domain/entities/products_entity.dart';
import 'package:arafah/features/shop/domain/entities/sub_categories_entity.dart';
import 'package:arafah/features/shop/domain/usecases/get_campaigns_usecase.dart';
import 'package:arafah/features/shop/domain/usecases/get_categories_usecase.dart';
import 'package:arafah/features/shop/domain/usecases/get_product_usecase.dart';
import 'package:arafah/features/shop/domain/usecases/get_sub_categories_usecase.dart';
import 'package:arafah/features/shop/presentation/bloc/shop_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent,ShopState> {

  ShopBloc() :super(ShopState.initial()) {
    on<InitialEvent>(_onInitialEvent);
    on<GetCampaigns>(_onGetCampaigns);
    on<GetCategories>(_onGetCategories);
    on<GetSubCategories>(_onGetSubCategories);
    on<GetProducts>(_onGetProducts);
    on<GetMoreProducts>(_onGetMoreProducts);
    on<GetNewestProducts>(_onGetNewestProducts);
    on<GetMoreNewestProducts>(_onGetMoreNewestProducts);
    on<GetCtgProducts>(_onGetCtgProducts);
    on<GetMoreCtgProducts>(_onGetMoreCtgProducts);
    on<GetPopularProducts>(_onGetPopularProducts);
    on<GetMorePopularProducts>(_onGetMorePopularProducts);
    on<GetBestProducts>(_onGetBestProducts);
    on<GetMoreBestProducts>(_onGetMoreBestProducts);
    on<GetDiscountsProducts>(_onGetDiscountsProducts);
    on<GetMoreDiscountsProducts>(_onGetMoreDiscountsProducts);
  }


  Future<void> _onInitialEvent(InitialEvent event, Emitter<ShopState> emit) async {
    add(GetCampaigns());
    add(GetCategories());
    add(GetProducts(queryParams: {}));
    add(GetNewestProducts(queryParams: {}));
    add(GetDiscountsProducts(queryParams: {}));
    add(GetBestProducts(queryParams: {}));
    add(GetPopularProducts(queryParams: {}));
  }



  Future<void> _onGetCampaigns(GetCampaigns event, Emitter<ShopState> emit) async {
    //if((state.campaignsEntity?.campaigns).isNotNullAndNotEmpty) return;
    emit(state.copyWith(campaignStatus: Status.loading));
    var result = await sl<GetCampaignsUseCase>().call();
    result.fold(
            (error) => emit(state.copyWith(campaignStatus: Status.error, message: error.message)),
            (data) => emit(state.copyWith(
              campaignStatus: Status.success,
              campaignsEntity: data,
            ))
    );
  }


  Future<void> _onGetCategories(GetCategories event, Emitter<ShopState> emit) async {
    //if((state.categoriesEntity?.categories).isNotNullAndNotEmpty) return;
    emit(state.copyWith(categoryStatus: Status.loading));
    var result = await sl<GetCategoriesUseCase>().call();
    result.fold(
            (error) => emit(state.copyWith(categoryStatus: Status.error, message: error.message)),
            (data) => emit(state.copyWith(
              categoryStatus: Status.success,
              categoriesEntity: data,
            ))
    );
  }


  Future<void> _onGetSubCategories(GetSubCategories event, Emitter<ShopState> emit) async {
    emit(state.copyWith(subCategoriesStatus: Status.loading));
    var result = await sl<GetSubCategoriesUseCase>().call(params: event.categoryId);
    result.fold(
            (error) => emit(state.copyWith(subCategoriesStatus: Status.error, message: error.message)),
            (data) => emit(state.copyWith(
              subCategoriesStatus: Status.success,
              subCategoriesEntity: data,
            ))
    );
  }



  Future<void> _onGetCtgProducts(GetCtgProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(ctgProductsStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": 1,
      "limit": 10,
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(ctgProductsStatus: Status.error, message: error.message)),
            (data) => emit(state.copyWith(
                ctgProductsStatus: Status.success,
                productsEntity: data,
                ctgBaseProducts: data.productsData?.products
            ))
    );
  }


  Future<void> _onGetMoreCtgProducts(GetMoreCtgProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(ctgProductsPaginationStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": (state.productsEntity?.productsData?.meta?.page ?? 0) + 1,
      "limit": 10,
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(ctgProductsPaginationStatus: Status.error, message: error.message)),
            (data){
          emit(state.copyWith(
              ctgProductsPaginationStatus: Status.success,
              productsEntity: data,
              ctgBaseProducts: [...?state.ctgBaseProducts, ...?data.productsData?.products]
          ));
        }
    );
  }



  Future<void> _onGetProducts(GetProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(status: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": 1,
      "limit": 10
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(status: Status.error, message: error.message)),
            (data) => emit(state.copyWith(
            status: Status.success,
            productsEntity: data,
            products: data.productsData?.products
        ))
    );
  }


  Future<void> _onGetMoreProducts(GetMoreProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(productsPaginationStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": (state.productsEntity?.productsData?.meta?.page ?? 0) + 1,
      "limit": 10
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(productsPaginationStatus: Status.error, message: error.message)),
            (data){
          emit(state.copyWith(
              productsPaginationStatus: Status.success,
              productsEntity: data,
              products: [...?state.products, ...?data.productsData?.products]
          ));
        }
    );
  }



  Future<void> _onGetNewestProducts(GetNewestProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(newestProductsStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": 1,
      "limit": 10,
      "by_product": "newest"
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(newestProductsStatus: Status.error, message: error.message)),
            (data) => emit(state.copyWith(
                newestProductsStatus: Status.success,
                productsEntity: data,
                newestProducts: data.productsData?.products
        ))
    );
  }


  Future<void> _onGetMoreNewestProducts(GetMoreNewestProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(newestProductsPaginationStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": (state.productsEntity?.productsData?.meta?.page ?? 0) + 1,
      "limit": 10,
      "by_product": "newest"
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(newestProductsPaginationStatus: Status.error, message: error.message)),
            (data){
          emit(state.copyWith(
              newestProductsPaginationStatus: Status.success,
              productsEntity: data,
              newestProducts: [...?state.newestProducts, ...?data.productsData?.products]
          ));
        }
    );
  }


  Future<void> _onGetPopularProducts(GetPopularProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(popularProductsStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": 1,
      "limit": 10,
      "by_product": "most_popular"
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(popularProductsStatus: Status.error, message: error.message)),
            (data) => emit(state.copyWith(
                popularProductsStatus: Status.success,
                productsEntity: data,
                popularProducts: data.productsData?.products
        ))
    );
  }


  Future<void> _onGetMorePopularProducts(GetMorePopularProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(popularPaginationStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": (state.productsEntity?.productsData?.meta?.page ?? 0) + 1,
      "limit": 10,
      "by_product": "most_popular"
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(popularPaginationStatus: Status.error, message: error.message)),
            (data){
          emit(state.copyWith(
              popularPaginationStatus: Status.success,
              productsEntity: data,
              popularProducts: [...?state.popularProducts, ...?data.productsData?.products]
          ));
        }
    );
  }



  Future<void> _onGetBestProducts(GetBestProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(bestProductsStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": 1,
      "limit": 10,
      "by_product": "best_selling"
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(bestProductsStatus: Status.error, message: error.message)),
            (data) => emit(state.copyWith(
                bestProductsStatus: Status.success,
                productsEntity: data,
                bestSellingProducts: data.productsData?.products
            ))
    );
  }


  Future<void> _onGetMoreBestProducts(GetMoreBestProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(bestPaginationStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": (state.productsEntity?.productsData?.meta?.page ?? 0) + 1,
      "limit": 10,
      "by_product": "best_selling"
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(bestPaginationStatus: Status.error, message: error.message)),
            (data){
          emit(state.copyWith(
              bestPaginationStatus: Status.success,
              productsEntity: data,
              bestSellingProducts: [...?state.bestSellingProducts, ...?data.productsData?.products]
          ));
        }
    );
  }



  Future<void> _onGetDiscountsProducts(GetDiscountsProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(discountsProductsStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": 1,
      "limit": 10,
      "by_product": "special_discount"
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(discountsProductsStatus: Status.error, message: error.message)),
            (data) => emit(state.copyWith(
                discountsProductsStatus: Status.success,
                productsEntity: data,
                discountsProducts: data.productsData?.products
        ))
    );
  }


  Future<void> _onGetMoreDiscountsProducts(GetMoreDiscountsProducts event, Emitter<ShopState> emit) async {
    emit(state.copyWith(discountsPaginationStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "page": (state.productsEntity?.productsData?.meta?.page ?? 0) + 1,
      "limit": 10,
      "by_product": "special_discount"
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(discountsPaginationStatus: Status.error, message: error.message)),
            (data){
          emit(state.copyWith(
              discountsPaginationStatus: Status.success,
              productsEntity: data,
              discountsProducts: [...?state.discountsProducts, ...?data.productsData?.products]
          ));
        }
    );
  }


}