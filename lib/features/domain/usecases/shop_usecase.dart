import 'package:arafah/core/error/failure.dart';
import 'package:arafah/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class ShopUseCase extends UseCase<bool, dynamic>{
  @override
  Future<Either<Failure, bool>> call({params}) async {
    // TODO: implement call
    throw UnimplementedError();
  }
}