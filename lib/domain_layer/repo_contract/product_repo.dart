
import 'package:dartz/dartz.dart';
import 'package:elevate_task/domain_layer/entity/productEntity.dart';

import '../../data_layer/model/ProductResponse.dart';

abstract class ProductRepo{
  Future<Either<List<ProductEntity>,String>>GetProduct();

}