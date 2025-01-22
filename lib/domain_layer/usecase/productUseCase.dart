
import 'package:dartz/dartz.dart';
import 'package:elevate_task/domain_layer/entity/productEntity.dart';
import 'package:elevate_task/domain_layer/repo_contract/product_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class productUsecase{
  @factoryMethod
  ProductRepo productRepo;
  productUsecase(this.productRepo);

  Future<Either<List<ProductEntity>, String>> call() {
    return productRepo.GetProduct();
  }
}