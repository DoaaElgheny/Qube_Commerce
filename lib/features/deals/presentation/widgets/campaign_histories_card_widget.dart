import 'package:flutter/material.dart';
import 'package:qubeCommerce/features/deals/deals_export.dart';

import '../../../../core/utils/app_utils.dart';

class CampaignHistoriesCardWidget extends StatelessWidget {
  const CampaignHistoriesCardWidget({super.key, required this.campaignHistoriesModel});
final CampaignHistoriesModel campaignHistoriesModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 16, top: 16, bottom: 16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow(
              'assets/images/png/Calendar.png',
              "تاريخ الحملة",
              "${AppUtils.formatDateToString(campaignHistoriesModel.startDate)}",
            ),
            const SizedBox(
              height: 15,
            ),
            _buildRow(
              'assets/images/png/Time2.png',
              "مدة الحملة",
              "14 يوم",
            ),
            const SizedBox(
              height: 15,
            ),
            _buildRow(
              'assets/images/png/tick.png',
              "الطلبات الناجحة",
              "${campaignHistoriesModel.totalOrders}",
            ),
            const SizedBox(
              height: 15,
            ),
            _buildRow(
              'assets/images/png/XML.png',
              "متوسط الأرباح",
              "${campaignHistoriesModel.avarageProfit}%",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String assetPath, String value, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //SizedBox(),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        // const SizedBox(
        //   width: 100,
        // ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 12),
            Image.asset(assetPath, height: 23, fit: BoxFit.cover),
          ],
        ),
      ],
    );
  }
}
