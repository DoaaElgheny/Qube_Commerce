import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/config/routes/app_routes.dart';
import 'package:qubeCommerce/core/api/end_points.dart';
import 'package:qubeCommerce/core/utils/app_utils.dart';
import 'package:qubeCommerce/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:qubeCommerce/injection_container.dart';
import 'package:qubeCommerce/shared/widget/loader_widget.dart';

import '../../../../shared/widget/snack_bar.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../home/presentation/cubit/home_state.dart';
import '../../deals_export.dart';
import '../cubit/join_deal_cubit.dart';

class JoinDealScreen extends StatelessWidget {
  const JoinDealScreen({super.key});

  // bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    final dealDetails = AppUtils.getArguments(context) as DealsDetailsModel;
    final walletCubit = serviceLocator<WalletCubit>();
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is GetSettingsLoadedState,
        builder: (context, state) {
          final settingModel = serviceLocator<HomeCubit>().settingModel;
          if (settingModel == null) return const SizedBox.shrink();
          final serviceFees = settingModel.serviceFees!.replaceAll('٫', '.');
          return BlocProvider(
            create: (context) => JoinDealCubit()..getServiceFees(serviceFees),
            child: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
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
                              'assets/images/png/chevron-down.png',
                              width: 25,
                              height: 25,
                              color: const Color(0XFF000080),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 136,
                            width: 135,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '${EndPoints.baseUrl}/${dealDetails.pictures!.first.filePath}'))),
                          ),
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${dealDetails.name}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${dealDetails.campaignCode}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(":الحد الأدنى للإنضمام#",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    Row(
                                      children: [
                                        Text(
                                          "${dealDetails.minimumOrderValue}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF38A169),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "ج.م",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFF38A169),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    //
                    //
                    Container(
                      height: 104,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/png/ConImage.png'), // Add your image to the assets folder
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/png/Wallet.png",
                                  height: 23, fit: BoxFit.cover),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'رصيدي',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'ج.م‎ ${walletCubit.myWallets!.first.availableBalance}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 68,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF000080)),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'شحن',
                                  style: TextStyle(
                                      color: Color(0xFF000080),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Icon(
                                  Icons.add,
                                  color: Color(0xFF000080),
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "قيمة الصفقة",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 48,
                              child: BlocBuilder<JoinDealCubit, JoinDealState>(
                                builder: (context, state) {
                                  return TextField(
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      hintText: "مثال: 5000",
                                      suffixIcon: const Image(
                                        image: AssetImage(
                                            "assets/images/png/money.png"),
                                      ),
                                      border: const OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFF000080)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFF000080)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onChanged: (value) =>
                                        JoinDealCubit.get(context)
                                            .changeDealValue(value),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "يجب أن يكون المبلغ المدخل أكبر من أو يساوي ${dealDetails.minimumOrderValue} ج.م للإنضمام",
                              style: const TextStyle(
                                color: Color(0xFFE53E3E),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      //color: Colors.amber,
                                      border: Border.all(
                                          color: const Color(0xFF000080),
                                          width: 1.5)),
                                  child: Checkbox(
                                    // value: _isChecked,
                                    value: false,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   _isChecked = value!;
                                      // });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'إضافة كود خصم',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            // if (_isChecked)
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: [
                            //     const SizedBox(height: 15),
                            //     const Text(
                            //       "كود الخصم",
                            //       style: TextStyle(
                            //           fontSize: 14,
                            //           color: Colors.black,
                            //           fontWeight: FontWeight.w700),
                            //     ),
                            //     const SizedBox(height: 8),
                            //     SizedBox(
                            //       height: 48,
                            //       child: TextField(
                            //         textAlign: TextAlign.end,
                            //         textAlignVertical: TextAlignVertical.center,
                            //         maxLines: 1,
                            //         decoration: InputDecoration(
                            //           suffixIcon: const Image(
                            //             image: AssetImage(
                            //                 "assets/images/png/discount.png"),
                            //           ),
                            //           border: const OutlineInputBorder(),
                            //           enabledBorder: OutlineInputBorder(
                            //             borderSide: const BorderSide(
                            //                 color: Color(0xFF000080)),
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //           focusedBorder: OutlineInputBorder(
                            //             borderSide: const BorderSide(
                            //                 color: Color(0xFF000080)),
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const DealSummaryCardWidget(),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocConsumer<JoinDealCubit, JoinDealState>(
                      listener: (context, state) {
                        if (state is JoinDealLoadedState) {
                          SnackBarUtility.successSnackBar(
                              context, 'تم اضافه الصفقة بنجاح');
                          Navigator.pushNamed(context, Routes.allMyDealsDeal);
                        } else if (state is JoinDealErrorState) {
                          SnackBarUtility.errorSnackBar(
                              context, state.message ?? '');
                        }
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () async {
                            await LoaderWidget.show(
                              context,
                              () => JoinDealCubit.get(context).joinDeal(
                                  campaignId: dealDetails.id!,
                                  walletId: walletCubit.myWallets!.first.id!),
                            );
                          },
                          child: Container(
                            height: 56,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Color(0xFFA6BE52),
                                    Color(0xFF24774C)
                                  ]),
                            ),
                            child: const Center(
                              child: Text(
                                "! إنضم الآن",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
