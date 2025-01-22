// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data_layer/datasource_contract/product_datasource.dart' as _i4;
import '../../data_layer/datasource_impl/productDatasource_imp.dart' as _i5;
import '../../data_layer/repo_imp/product_repoimp.dart' as _i7;
import '../../domain_layer/repo_contract/product_repo.dart' as _i6;
import '../../domain_layer/usecase/productUseCase.dart' as _i8;
import '../../presentation/home_page/ViewModel/home_view_model_cubit.dart'
    as _i9;
import '../api/apiManager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ProductDataSourceContract>(
        () => _i5.ProductDataSourceimp(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductRepo>(
        () => _i7.ProductRepoImp(gh<_i4.ProductDataSourceContract>()));
    gh.factory<_i8.productUsecase>(
        () => _i8.productUsecase(gh<_i6.ProductRepo>()));
    gh.factory<_i9.HomeViewModel>(
        () => _i9.HomeViewModel(gh<_i8.productUsecase>()));
    return this;
  }
}
