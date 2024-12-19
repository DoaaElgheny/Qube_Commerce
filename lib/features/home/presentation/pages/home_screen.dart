import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeCommerce/config/locale/app_localizations.dart';
import 'package:qubeCommerce/config/routes/app_routes.dart';
import 'package:qubeCommerce/core/authentication/provider.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:qubeCommerce/injection_container.dart';
import 'package:qubeCommerce/shared/widget/loader_widget.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../deals/deals_export.dart';
import '../../../wallet/wallet_export.dart';
import '../widgets/special_booked_list_widget.dart';
import '../widgets/special_booked_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchControllerHome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => serviceLocator<DealsCubit>()
              ..getAvailableDeals()
              ..getMyDeals(),
          ),
        ],
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images_new/header_back.png'),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images_new/user_image.png',
                            width: 48,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                text: AuthenticationProvider.instance
                                        .currentUser?.details.fullName ??
                                    '',
                                color: AppColors.primaryColor,
                                weight: FontWeight.bold,
                                fontSize: 16,
                                align: TextAlign.start,
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(80),
                                border: Border.all(
                                  color:
                                      AppColors.containerNotificationHomeColor,
                                  width: 1,
                                ),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Center(
                                    child: SvgPicture.asset(
                                      'assets/icons/home_icons/vector.svg',
                                      width: 18,
                                    ),
                                  ),
                                  Positioned(
                                    top: -2,
                                    right: 0,
                                    child: Container(
                                      width: 9,
                                      height: 9,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                10, // Adjust font size as needed
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const WalletCardHomeWidget()
                  ],
                ),
                //SizedBox(height: 1.h),

                BlocBuilder<DealsCubit, DealsState>(
                  builder: (context, state) {
                    final cubit = DealsCubit.get(context);
                    if (cubit.myDeals==null) {
                      return LoaderWidget.circleProgressIndicator();
                    }
                    else if (cubit.myDeals!.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('My_deals')!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${cubit.myDeals!.length}${AppLocalizations.of(context)!.translate('deal')!}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.allMyDealsDeal);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('View_all')!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpecialBookedListCard(
                          specialBookedCard: cubit.myDeals!.map((deal) {
                            return SpecialBookedCard(
                              // image: deal!.picture!.filePath!,
                              // productCategory: deal.categoryTitle!,
                              // productName: deal.name!,
                              // productNumber: deal.participantsCount,
                              deal: deal,
                              svgPath1:
                                  'assets/icons/overview_section/Bag 1.svg',
                              svgPath2:
                                  'assets/icons/overview_section/Calender 1.svg',
                              // date: '2024-10-10',
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<DealsCubit, DealsState>(
                  builder: (context, state) {
                    final cubit = DealsCubit.get(context);
                    if (cubit.availableDeals == null)
                      return LoaderWidget.circleProgressIndicator();
                    else if (cubit.availableDeals!.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('Available_deals')!,
                                    style: TextStyle(
                                      color: AppColors.greyTextDarkColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${cubit.availableDealsData!.totalCount}${AppLocalizations.of(context)!.translate('deals')!}',
                                    style: TextStyle(
                                      color: AppColors.greyTextColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.allAvaliabledDeal);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('View_all')!,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    // Underline thickness

                                    fontSize: 14,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        SpecialBookedListCard(
                          carouselHeight: 433,
                          specialBookedCard: cubit.availableDeals!.map((deal) {
                            return SpecialBookedCard(
                              deal: deal,
                              height: 420,
                              box: true,
                              showButton: false,
                              numberOfPeople: deal!.participantsCount,
                              showNumberOfPeople: true,
                              linearProgressIndicator: LinearProgressIndicator(
                                backgroundColor:
                                    AppColors.backgroundProgressBarGreyColor,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.green),
                                color: Colors.transparent,
                                minHeight: 12,
                                value: 0.5,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              showCarouselSliderTwo: true,

                              svgPath1:
                                  'assets/icons/overview_section/Bag 1.svg',
                              svgPath2:
                                  'assets/icons/overview_section/Calender 1.svg',
                              // date: AppUtils.formatDateToString(deal.startDate!)??'',
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),

                // SpecialBookedListCard(
                //   carouselHeight: 405,

                //   specialBookedCard: [
                //     SpecialBookedCard(
                //       deal: null,
                //       height: 395,
                //       box: Container(
                //         height: 45,
                //         decoration: BoxDecoration(
                //           color: AppColors.carouselSliderContainerColor,
                //         ),
                //         child: Row(
                //           children: [
                //             Container(
                //               width: 55,
                //               height: 45,
                //               decoration: BoxDecoration(
                //                 gradient: LinearGradient(
                //                   begin: Alignment.topCenter,
                //                   end: Alignment.bottomCenter,
                //                   colors: [
                //                     AppColors.redLinearGradientLighter,
                //                     AppColors.redLinearGradientDarker,
                //                   ],
                //                 ),
                //               ),
                //               child: const Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '4',
                //                     style: TextStyle(
                //                       fontSize: 16,
                //                     ),
                //                   ),
                //                   Text(
                //                     'hour',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             const SizedBox(width: 2),
                //             Container(
                //               width: 55,
                //               height: 45,
                //               decoration: BoxDecoration(
                //                 gradient: LinearGradient(
                //                   begin: Alignment.topCenter,
                //                   end: Alignment.bottomCenter,
                //                   colors: [
                //                     AppColors.redLinearGradientLighter,
                //                     AppColors.redLinearGradientDarker,
                //                   ],
                //                 ),
                //               ),
                //               child: const Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '31',
                //                     style: TextStyle(
                //                       fontSize: 16,
                //                     ),
                //                   ),
                //                   Text(
                //                     'minutes',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             const SizedBox(width: 2),
                //             Container(
                //               width: 55,
                //               height: 45,
                //               decoration: BoxDecoration(
                //                 gradient: LinearGradient(
                //                   begin: Alignment.topCenter,
                //                   end: Alignment.bottomCenter,
                //                   colors: [
                //                     AppColors.redLinearGradientLighter,
                //                     AppColors.redLinearGradientDarker,
                //                   ],
                //                 ),
                //               ),
                //               child: const Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '44',
                //                     style: TextStyle(
                //                       fontSize: 16,
                //                     ),
                //                   ),
                //                   Text(
                //                     'seconds',
                //                     style: TextStyle(
                //                       fontSize: 12,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             const SizedBox(width: 48),
                //             Container(
                //               width: 55,
                //               height: 45,
                //               decoration: BoxDecoration(
                //                 color: AppColors.carouselSliderContainerColor,
                //               ),
                //               child: Center(
                //                 child: Text(
                //                   'Join in:',
                //                   style: TextStyle(
                //                     color: AppColors.redLinearGradientLighter,
                //                     fontSize: 14,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       // image:
                //       //     'assets/images_new/products/ANIMAL KING _ pet food_ packaging.jpeg',
                //       // productCategory: 'Animal king',
                //       // productName: 'Turkey Rice',
                //       // svgPath1: 'assets/icons/overview_section/Team 1.svg',
                //       // svgPath2: null,
                //       // date: 'How profitable deal:',
                //       showButton: false,
                //       numberOfPeople: 6,
                //       showNumberOfPeople: true,
                //       linearProgressIndicator: LinearProgressIndicator(
                //         backgroundColor:
                //             AppColors.backgroundProgressBarGreyColor,
                //         valueColor:
                //             AlwaysStoppedAnimation<Color>(AppColors.green),
                //         color: Colors.transparent,
                //         minHeight: 12,
                //         value: 0.5,
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //       showCarouselSliderTwo: true,
                //     ),
                //   ],
                // ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
