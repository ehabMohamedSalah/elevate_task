part of 'home_view_model_cubit.dart';

@immutable
sealed class HomeViewModelState {}

final class HomeViewModelInitial extends HomeViewModelState {}
class HomeloadingState extends HomeViewModelState{}
class HomeErrorState extends HomeViewModelState{
  String ErrorMsg;
  HomeErrorState(this.ErrorMsg);
}
class HomeSuccessState extends HomeViewModelState{
  List<ProductEntity> entity;
  HomeSuccessState(this.entity);
}

