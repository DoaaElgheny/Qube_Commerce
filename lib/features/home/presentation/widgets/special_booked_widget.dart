import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qubeCommerce/config/locale/app_localizations.dart';
import 'package:qubeCommerce/core/api/end_points.dart';
import 'package:qubeCommerce/core/shared_widgets/elevated_btn.dart';
import 'package:qubeCommerce/core/shared_widgets/elevated_button_full_width.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:qubeCommerce/features/deals/presentation/pages/all_avaliable_deal.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../deals/deals_export.dart';
import '../../../deals/presentation/pages/deal_details_page.dart';

class SpecialBookedCard extends StatefulWidget {
  // final String image;
  // final String productCategory;
  // final String productName;
  // final int? productNumber;
  final String svgPath1;
  final String? svgPath2;
  // final String date;
  final bool? box;
  final double? height;
  final bool showButton;
  final int? numberOfPeople;
  final bool showNumberOfPeople;
  final LinearProgressIndicator? linearProgressIndicator;
  final bool? showCarouselSliderTwo;
  final DealModel? deal;
  const SpecialBookedCard(
      {super.key,
      // required this.image,
      // required this.productCategory,
      // required this.productName,
      required this.svgPath1,
      // required this.date,
      this.svgPath2,
      this.box,
      this.height = 312,
      this.showButton = true,
      this.numberOfPeople,
      // this.productNumber,
      this.showNumberOfPeople = false,
      this.linearProgressIndicator,
      this.showCarouselSliderTwo = false,
      required this.deal});

  @override
  _SpecialBookedCardState createState() => _SpecialBookedCardState();
}

class _SpecialBookedCardState extends State<SpecialBookedCard> {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  @override
  void initState() {
    super.initState();
    _calculateTimeDifference();
  }

  // Calculate the time difference
  void _calculateTimeDifference() {
    final now = DateTime.now();
    final startDate = DateTime.parse(widget.deal!.startDate!);
    final isDateAfter = startDate.isAfter(now);
    if (isDateAfter) {
      final difference = now.difference(startDate).abs();
      setState(() {
        hours = difference.inHours;
        minutes = difference.inMinutes.remainder(60);
        seconds = difference.inSeconds.remainder(60);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                child: CarouselSlider(
                  items: [
                    Column(
                      children: [
                        if (widget.box == true) ...{
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.carouselSliderContainerColor,
                            ),
                            child: Row(
                              children: [
                          
                                Container(
                                  width: 150,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.carouselSliderContainerColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('join')!,
                                      style: TextStyle(
                                        color:
                                            AppColors.redLinearGradientLighter,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                           
                               Container(
                                  width: 55,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColors.redLinearGradientLighter,
                                        AppColors.redLinearGradientDarker,
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$seconds',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .translate('seconds')!,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Container(
                                  width: 55,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColors.redLinearGradientLighter,
                                        AppColors.redLinearGradientDarker,
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$minutes',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .translate('miuntes')!,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 2),
                             
                                Container(
                                  width: 55,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColors.redLinearGradientLighter,
                                        AppColors.redLinearGradientDarker,
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$hours',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .translate('hours')!,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                          ),
                        },
                        Image.network(
                          '${EndPoints.baseUrl}${widget.deal!.picture!.filePath}',
                          height: 176,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 8,
                            right: 8,
                            bottom: 1,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.deal?.name ?? '',
                                    style: TextStyle(
                                      color: AppColors.greyTextDarkColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.greyColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      widget.deal?.categoryTitle ?? '',
                                      style: TextStyle(
                                        color: AppColors.greyTextColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      if (widget.svgPath2 != null)
                                        SvgPicture.asset(
                                          widget.svgPath2!,
                                          width: 15,
                                          colorFilter: ColorFilter.mode(
                                            AppColors.productSvg2Color,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      const SizedBox(width: 7),
                                      Text(
                                        AppUtils.formatDateToString(
                                                widget.deal?.startDate) ??
                                            '',
                                        style: TextStyle(
                                          color: AppColors.greyTextColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [ SvgPicture.asset(
                                        widget.svgPath1,
                                        width: widget.showCarouselSliderTwo!
                                            ? 19.5
                                            : 14.6,
                                      ),
                                       const SizedBox(width: 4),
                                     
                                      Text(
                                        widget.showNumberOfPeople
                                            ? '${widget.numberOfPeople ?? 0}'
                                            : '${widget.deal?.participantsCount ?? 0} طلب',
                                        style: TextStyle(
                                          fontSize:
                                              widget.showCarouselSliderTwo!
                                                  ? 20
                                                  : 14,
                                          fontWeight: FontWeight.bold,
                                          color: widget.showNumberOfPeople
                                              ? AppColors.productTextBlueColor
                                              : AppColors.productTextGreenColor,
                                        ),
                                      ),
                                     
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (widget.linearProgressIndicator != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 8.0),
                                width: 176,
                                child: widget.linearProgressIndicator,
                              ),
                            ],
                          ),
                        const SizedBox(height: 16),
                        if (widget.showCarouselSliderTwo!)
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .translate('minimjoin')!,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.greyTextDarkColor,
                                      ),
                                    ),
                                    Text(
                                      '${widget.deal!.minimumOrderValue} EGP',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.productTextGreenColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 48,
                                  width: 126,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors
                                            .backgroundProgressBackgroundLighGreen,
                                        AppColors
                                            .backgroundProgressBackgroundDarkGreen,
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('joindeal')!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (widget.showButton)
                          elevatedButtonWithoutWidth(
                            icon: const Text(''),
                            width: double.infinity,
                            height: 42,
                            primaryColor: AppColors.primaryColor,
                            onpressed: () {
                              DealsCubit.get(context)
                                  .getDetailsOfDeals(widget.deal!.id!);
                              Navigator.pushNamed(
                                  context, Routes.dealDetailsPageRoute,
                                  arguments: DealsCubit.get(context));
                            },
                            title: AppLocalizations.of(context)!
                                .translate('View_details')!,
                            loading: false,
                          ),
                      ],
                    ),
                  ],
                  options: CarouselOptions(
                    height: widget.height,
                    enlargeCenterPage: true,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
