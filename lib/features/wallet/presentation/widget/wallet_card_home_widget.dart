import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeCommerce/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:qubeCommerce/injection_container.dart';
import 'package:qubeCommerce/shared/widget/loader_widget.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/shared_widgets/elevated_btn.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/widgets/container_box.dart';

class WalletCardHomeWidget extends StatelessWidget {
  const WalletCardHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        final walletCubit = serviceLocator<WalletCubit>();

        if (walletCubit.myWallets == null) {
          return LoaderWidget.circleProgressIndicator();
        } else if (walletCubit.myWallets!.isEmpty) {
          return const SizedBox.shrink();
        }
        final myWallet=walletCubit.myWallets!.first;
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 88.0),
              child: Align(
                alignment: Alignment.center,
                child: ContainerBox(
                  text: AppLocalizations.of(context)!
                      .translate('Expected_profits')!,
                  number: '${myWallet.profitBalance}',
                  onTap: () {},
                  boxColor: AppColors.productTextBlueColor,
                  textColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 168.0),
              child: Align(
                alignment: Alignment.center,
                child: ContainerBox(
                  text: AppLocalizations.of(context)!.translate('my_balance')!,
                  number: '${myWallet.availableBalance}',
                  onTap: () {},
                  boxColor: Colors.white,
                  textColor: AppColors.productTextBlueColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButtonWithoutWidth(
                    height: 48,
                    width: 175,
                    primaryColor: Colors.blue.shade900,
                    onpressed: () {},
                    title: AppLocalizations.of(context)!
                        .translate('Withdraw_balance')!,
                    borderRadius: 10,
                    icon: SvgPicture.asset(
                      'assets/icons/home_icons/withdraw_balance.svg',
                      width: 25,
                    ),
                    loading: false,
                  ),
                  const SizedBox(width: 17),
                  elevatedButtonWithoutWidth(
                    height: 48,
                    width: 163,
                    primaryColor: Colors.blue.shade900,
                    borderRadius: 10,
                    onpressed: () {},
                    title:
                        AppLocalizations.of(context)!.translate('Add_balance')!,
                    icon: SvgPicture.asset(
                      'assets/icons/home_icons/withdraw_balance.svg',
                      width: 25,
                    ),
                    loading: false,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
