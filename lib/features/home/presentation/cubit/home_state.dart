import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  final String? title;
  final String? message;
  const HomeState({this.title, this.message});

  @override
  List<Object> get props => [identityHashCode(this)];
}

class HomeInitial extends HomeState {}

class GetSettingsLoadedState extends HomeState {}

class GetProfitabilityTypesLoadedState extends HomeState {}

class HomeErrorState extends HomeState {
  const HomeErrorState({super.title, super.message});
}
