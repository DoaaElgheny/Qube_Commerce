part of 'deals_cubit.dart';

abstract class DealsState extends Equatable {
  final String? title;
  final String? message;
  const DealsState({this.title, this.message});

  @override
  List<Object> get props => [identityHashCode(this)];
}

class DealsInitial extends DealsState {}

class DealsLoadingState extends DealsState {}

class DealsLoadedState extends DealsState {}

class GetMyDealsLoadingState extends DealsState {}

class GetMyDealsLoadedState extends DealsState {}

class GetDetailsOfDealsLoadingState extends DealsState {}
class GetDetailsOfDealsLoadedState extends DealsState {}

class DealsErrorState extends DealsState {
  const DealsErrorState({required String super.message, super.title});
}
