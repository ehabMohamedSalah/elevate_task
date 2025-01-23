import 'package:dartz/dartz.dart';
import 'package:elevate_task/data_layer/datasource_contract/product_datasource.dart';
import 'package:elevate_task/data_layer/model/Products.dart';
 import 'package:elevate_task/domain_layer/repo_contract/product_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domain_layer/entity/productEntity.dart';
import '../model/ProductResponse.dart';

@Injectable(as: ProductRepo)
class ProductRepoImp extends ProductRepo {
  @factoryMethod
  ProductDataSourceContract apiDatasource;
  ProductRepoImp(this.apiDatasource);

  @override
  Future<Either<List<ProductEntity>,String>> GetProduct() async {
    var response = await apiDatasource.GetProduct();
    return response.fold(
          (response) {
             List<ProductEntity> productEntity = response.products!.map((item) => item.toProductEntity()).toList();
        return left(productEntity);
      },
          (error) => right(error),
    );
  }
}
