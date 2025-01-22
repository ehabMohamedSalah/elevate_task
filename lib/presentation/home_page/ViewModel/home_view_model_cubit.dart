import 'package:bloc/bloc.dart';
 import 'package:elevate_task/domain_layer/entity/productEntity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain_layer/usecase/productUseCase.dart';

part 'home_view_model_state.dart';
@injectable
class HomeViewModel extends Cubit<HomeViewModelState> {

  productUsecase productUseCase;
  @factoryMethod
  HomeViewModel(this.productUseCase) : super(HomeViewModelInitial());

  getProduct()async{
    emit(HomeloadingState());
    var response=await productUseCase.call();
    response.fold(
            (products) => emit(HomeSuccessState(products)),
            (ErrorMsg) => emit(HomeErrorState(ErrorMsg))
    );

  }
}
