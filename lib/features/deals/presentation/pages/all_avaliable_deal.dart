import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeCommerce/config/locale/app_localizations.dart';
import 'package:qubeCommerce/core/shared_widgets/text_filed.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:qubeCommerce/core/utils/assets_manager.dart';
import 'package:qubeCommerce/features/deals/data/models/get_available_deals_model.dart';
import 'package:qubeCommerce/features/deals/presentation/cubit/deals_cubit.dart';
import 'package:qubeCommerce/features/deals/presentation/widgets/paginated_widget.dart';
import 'package:qubeCommerce/features/home/presentation/widgets/filter_botom_sheet.dart';
import 'package:qubeCommerce/features/home/presentation/widgets/special_booked_widget.dart';
import 'package:qubeCommerce/injection_container.dart';
import 'package:qubeCommerce/shared/widget/loader_widget.dart';
import 'package:sizer/sizer.dart';

class AllAvaliableScreen extends StatelessWidget {
  const AllAvaliableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => serviceLocator<DealsCubit>()..getAvailableDeals(),
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 20.h,
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
                    BlocBuilder<DealsCubit, DealsState>(
                      buildWhen: (previous, current) =>
                          current is DealsSearchChangedState,
                      builder: (context, state) {
                        final dealsCubit = DealsCubit.get(context);
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFiledCustom(
                            isReadOnly: false,
                            onTab: () {
                              // Navigator.pushNamed(context, Routes.searchScreen);
                            },
                            onChanged: (val) {
                              dealsCubit.changeSearchDeals(val);
                            },
                            onFieldSubmitted: (val) async =>
                                await LoaderWidget.show(
                              context,
                              () => dealsCubit.getAvailableDeals(),
                            ),
                            isBorder: true,
                            isFilled: true,
                            borderColor:
                                AppColors.containerNotificationHomeColor,
                            vertical: 5,
                            prifixIcon: InkWell(
                              onTap: () async => await LoaderWidget.show(
                                context,
                                () => dealsCubit.getAvailableDeals(),
                              ),
                              child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 8.0, end: 8),
                                  child: SvgPicture.asset(
                                      ImageAssets.search_explor)),
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (dealsCubit
                                    .searchControllerHome.text.isNotEmpty)
                                  InkWell(
                                    onTap: () async {
                                      dealsCubit.changeSearchDeals('');
                                      await LoaderWidget.show(
                                        context,
                                        () => dealsCubit.getAvailableDeals(),
                                      );
                                    },
                                    child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 8.0, end: 8),
                                        child: SvgPicture.asset(
                                            ImageAssets.close_button)),
                                  ),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      enableDrag: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const FilterBottomSheet();
                                      },
                                    );
                                  },
                                  child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          end: 8.0, start: 8),
                                      child: SvgPicture.asset(
                                          ImageAssets.filter_icon)),
                                ),
                              ],
                            ),
                            validator: (v) {
                              return null;
                            },
                            textInputType: TextInputType.text,
                            hintColor: AppColors.hintColor,
                            fillColor: Colors.white,
                            errorColorBorder: Colors.red,
                            hintText: 'Search',
                            controller: dealsCubit.searchControllerHome,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              BlocBuilder<DealsCubit, DealsState>(
                builder: (context, state) {
                  final cubit = DealsCubit.get(context);
                  if (cubit.availableDeals == null) {
                    return LoaderWidget.circleProgressIndicator();
                  } else if (cubit.availableDeals!.isEmpty) {
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
                      PaginatedWidget(
                        items: cubit.availableDeals!,
                        itemBuilder: (context, item) => SpecialBookedCard(
                          deal: item,
                          height: 420,
                          box: true,
                          showButton: false,
                          numberOfPeople: 6,
                          showNumberOfPeople: true,
                          linearProgressIndicator: LinearProgressIndicator(
                            backgroundColor:
                                AppColors.backgroundProgressBarGreyColor,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(AppColors.green),
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
                        loadMore: () async {
                          if (cubit.availableDealsData!.hasNextPage!) {
                            await cubit.getAvailableDeals(
                                page:
                                    cubit.availableDealsData!.pageNumber! + 1);
                          }
                          return cubit.availableDeals!;
                        },
                      ),
                      // for (var deal in cubit.availableDeals!) ...{
                      //   SpecialBookedCard(
                      //     deal: deal,
                      //     height: 420,
                      //     box: true,
                      //     showButton: false,
                      //     numberOfPeople: 6,
                      //     showNumberOfPeople: true,
                      //     linearProgressIndicator: LinearProgressIndicator(
                      //       backgroundColor:
                      //           AppColors.backgroundProgressBarGreyColor,
                      //       valueColor: AlwaysStoppedAnimation<Color>(
                      //           AppColors.green),
                      //       color: Colors.transparent,
                      //       minHeight: 12,
                      //       value: 0.5,
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //     showCarouselSliderTwo: true,

                      //     svgPath1: 'assets/icons/overview_section/Bag 1.svg',
                      //     svgPath2:
                      //         'assets/icons/overview_section/Calender 1.svg',
                      //     // date: AppUtils.formatDateToString(deal.startDate!)??'',
                      //   ),
                      //   const SizedBox(
                      //     height: 15,
                      //   )
                      // },
                    ],
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
