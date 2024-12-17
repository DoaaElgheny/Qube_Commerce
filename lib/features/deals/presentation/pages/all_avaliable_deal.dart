import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/config/locale/app_localizations.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:qubeCommerce/features/deals/presentation/cubit/deals_cubit.dart';
import 'package:qubeCommerce/features/home/presentation/widgets/special_booked_widget.dart';
import 'package:qubeCommerce/injection_container.dart';
import 'package:sizer/sizer.dart';

class AllAvaliableScreen extends StatefulWidget {
  const AllAvaliableScreen({super.key});

  @override
  State<AllAvaliableScreen> createState() => _AllAvaliableScreenState();
}

class _AllAvaliableScreenState extends State<AllAvaliableScreen> {
  TextEditingController searchControllerHome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => serviceLocator<DealsCubit>()..getAvailableDeals(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 15.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/images_new/header_back.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0XFF000080),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/png/chevron-down.png',
                                    width: 25,
                                    height: 25,
                                    color: const Color(0XFF000080),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0XFF000080),
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/png/bell.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                BlocBuilder<DealsCubit, DealsState>(
                  builder: (context, state) {
                    final cubit = DealsCubit.get(context);
                    if (cubit.availableDeals.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
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
                                ],
                              ),
                              Text(
                                '${cubit.availableDealsData!.totalCount}${AppLocalizations.of(context)!.translate('deals')!}',
                                style: TextStyle(
                                  // Underline thickness

                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        for (var deal in cubit.availableDeals) ...{
                          SpecialBookedCard(
                            deal: deal,
                            height: 420,
                            box: true,
                            showButton: false,
                            numberOfPeople: 6,
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

                            svgPath1: 'assets/icons/overview_section/Bag 1.svg',
                            svgPath2:
                                'assets/icons/overview_section/Calender 1.svg',
                            // date: AppUtils.formatDateToString(deal.startDate!)??'',
                          ),
                      const SizedBox(height: 15,)
                        },
                      ],
                    );
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
