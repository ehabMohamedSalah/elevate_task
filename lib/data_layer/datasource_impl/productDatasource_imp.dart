
import 'package:dartz/dartz.dart';
import 'package:elevate_task/core/api/apiManager.dart';
 import 'package:injectable/injectable.dart';
import '../datasource_contract/product_datasource.dart';
import '../model/ProductResponse.dart';

@Injectable(as: ProductDataSourceContract)
  class ProductDataSourceimp extends ProductDataSourceContract{
  @factoryMethod
  ApiManager apiManager;
  ProductDataSourceimp(this.apiManager);

  Future<Either<ProductResponse,String>> GetProduct()async{
    try{

      var response=await apiManager.getRequest(Endpoint: "/products");
      var productList = ProductResponse.fromJson(response.data) ;
      return left(productList);
    }catch(error){
      return right(error.toString());
    }


  }
}
