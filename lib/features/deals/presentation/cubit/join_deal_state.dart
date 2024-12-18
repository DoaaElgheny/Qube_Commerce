part of 'join_deal_cubit.dart';

sealed class JoinDealState extends Equatable {
  final String? message;
  final String? title;
  const JoinDealState({this.message, this.title});

  @override
  List<Object> get props => [identityHashCode(this)];
}

final class JoinDealInitial extends JoinDealState {}

final class JoinDealLoadingState extends JoinDealState {}

final class JoinDealLoadedState extends JoinDealState {}

final class JoinDealErrorState extends JoinDealState {
  const JoinDealErrorState({super.message, super.title});
}
