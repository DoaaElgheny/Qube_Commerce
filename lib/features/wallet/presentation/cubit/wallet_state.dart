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

class GetPaymentMethodsLoadingState extends WalletState {}

class GetPaymentMethodsLoadedState extends WalletState {}

class GetPaymentMethodsErrorState extends WalletState {
  const GetPaymentMethodsErrorState({super.title, super.message});
}

class WithdrawLoadingState extends WalletState {}

class WithdrawErrorState extends WalletState {
  const WithdrawErrorState({super.title, super.message});
}

class WithdrawSuccessState extends WalletState {
  const WithdrawSuccessState();
}

