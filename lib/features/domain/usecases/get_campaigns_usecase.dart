import 'package:arafah/config/service_locator/service_locator.dart';
import 'package:arafah/core/error/failure.dart';
import 'package:arafah/core/usecase/usecase.dart';
import 'package:arafah/features/shop/domain/entities/campaigns_entity.dart';
import 'package:arafah/features/shop/domain/repositories/shop_repositories.dart';
import 'package:dartz/dartz.dart';

class GetCampaignsUseCase extends UseCase<CampaignsEntity, dynamic>{

  @override
  Future<Either<Failure, CampaignsEntity>> call({params}) async =>
      await sl<ShopRepositories>().getCampaigns();

}