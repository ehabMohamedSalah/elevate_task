
import 'package:dartz/dartz.dart';

import '../model/ProductResponse.dart';

abstract class ProductDataSourceContract{
  Future<Either<ProductResponse,String>>GetProduct();

}