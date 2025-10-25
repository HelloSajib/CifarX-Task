import 'package:cifarx_task/config/service_locator/service_locator.dart';
import 'package:cifarx_task/core/utils/enums/enums.dart';
import 'package:cifarx_task/features/products/data/models/produts_model.dart';
import 'package:cifarx_task/features/products/domain/entities/products_entity.dart';
import 'package:cifarx_task/features/products/domain/usecases/get_products_usecase.dart';
import 'package:cifarx_task/features/products/presentation/bloc/products_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent,ProductsState> {

  ProductsBloc() :super(ProductsState.initial()) {
    on<GetProducts>(_onGetProducts);
    on<GetMoreProducts>(_onGetMoreProducts);
  }



  Future<void> _onGetProducts(GetProducts event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    Map<String,dynamic> updateQueryParams = {"limit": 10};
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductsUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(status: Status.error, message: error.message)),
            (data) => emit(state.copyWith(
                status: Status.success,
                productsEntity: data,
                products: data.products
            ))
    );
  }


  Future<void> _onGetMoreProducts(GetMoreProducts event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(paginationStatus: Status.loading));
    Map<String,dynamic> updateQueryParams = {
      "skip": (state.productsEntity?.skip ?? 0) + 10,
      "limit": 10
    };
    updateQueryParams.addAll(event.queryParams);
    var result = await sl<GetProductsUseCase>().call(params: updateQueryParams);
    result.fold(
            (error) => emit(state.copyWith(paginationStatus: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(
                  paginationStatus: Status.success,
                  status: Status.success,
                  productsEntity: data,
                  products: [...?state.products,...?data.products]
            ))
    );
  }


}