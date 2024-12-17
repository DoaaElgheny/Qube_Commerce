part of 'wallet_cubit.dart';

abstract class WalletState extends Equatable {
  final String? title;
  final String? message;

  const WalletState({this.title, this.message});

  @override
  List<Object> get props => [identityHashCode(this)];
}

class WalletInitial extends WalletState {}

class GetMyWalletsLoadingState extends WalletState {}

class GetMyWalletsLoadedState extends WalletState {}

class WalletErrorState extends WalletState {
  const WalletErrorState({super.title, super.message});
}
