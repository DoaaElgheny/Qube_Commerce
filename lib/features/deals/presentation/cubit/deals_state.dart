part of 'deals_cubit.dart';

abstract class DealsState extends Equatable {
  final String? title;
  final String? message;
  const DealsState({this.title, this.message});

  @override
  List<Object> get props => [identityHashCode(this)];
}

class DealsInitial extends DealsState {}

class DealsLoadingSttete extends DealsState {}

class DealsLoadedState extends DealsState {}

class GetMyDealsLoadingSttete extends DealsState {}

class GetMyDealsLoadedState extends DealsState {}

class DealsErrorState extends DealsState {
  const DealsErrorState({required String super.message, super.title});
}
