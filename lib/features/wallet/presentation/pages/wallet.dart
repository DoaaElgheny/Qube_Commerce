import 'package:flutter/material.dart';
import 'package:qubeCommerce/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:qubeCommerce/injection_container.dart';

import '../widget/withdraw_bottom_sheet.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletCubit = serviceLocator<WalletCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 296,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/images/png/authBack.png",
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  child: SizedBox(
                    height: 296,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
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
                                        const SizedBox(
                                          width: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 115,
                                        decoration: BoxDecoration(
                                          //shape: BoxShape.rectangle,
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: const Color(0XFF000080),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Text(
                                              "المعاملات",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF000080)),
                                            ),
                                            Image.asset(
                                              'assets/images/png/arrows-horizontal.png',
                                              width: 25,
                                              height: 25,
                                              color: const Color(0XFF000080),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "رصيد الأرباح :",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${walletCubit.myWallets!.first.profitBalance}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF06A6F1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            "ج.م",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF06A6F1),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 164,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'رصيدي:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${walletCubit.myWallets!.first.availableBalance}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF06A6F1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            "ج.م",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF06A6F1),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 48,
                                width: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFF0D05D2),
                                    Color(0xFF000080)
                                  ]),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'سحب',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(
                                        "assets/images/png/Walletplus.png",
                                        height: 16,
                                        width: 16,
                                        fit: BoxFit.cover),
                                  ],
                                ),
                              ),
                              Container(
                                height: 48,
                                width: 163,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFF0D05D2),
                                    Color(0xFF000080)
                                  ]),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Colors.black.withOpacity(0.5),
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () => Navigator.of(context).pop(),
                                          child: DraggableScrollableSheet(
                                            initialChildSize: 0.6,
                                            minChildSize: 0.6,
                                            maxChildSize: 1.0,
                                            builder: (BuildContext context, ScrollController scrollController) {
                                              return GestureDetector(
                                                onTap: () {},
                                                child: WithdrawBottomSheet(scrollController: scrollController,walletId: walletCubit.myWallets!.first.id!,),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );

                                  },

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'سحب',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Image.asset(
                                          "assets/images/png/Add Balance.png",
                                          height: 16,
                                          width: 16,
                                          fit: BoxFit.cover),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // SizedBox(
            //   height: 5,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(22.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       Text(
            //         'حالة الأرباح',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 15,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Text(
            //             'الحالة',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //           Text(
            //             'الأرباح',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //           Text(
            //             'المنتج',
            //             style: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 8,
            //       ),
            //       ProfitCardGreen('تم التحويل •', '2000 ج.م',
            //           'كرسي كمبيوتر شبكي', '#512497'),
            //       ProfitCardOrange(
            //           'تحت المعالجة •', '4000 ج.م', 'شنطة ضهر سفر', '#512497'),
            //       ProfitCardGreen('تم التحويل •', '3000 ج.م',
            //           'أدوات مطبخ خشبية', '#512497'),
            //       ProfitCardOrange(
            //           'تحت المعالجة •', '1000 ج.م', 'إير فراير', '#512497'),
            //       // ProfitCardGreen(
            //       //     'تم التحويل •', '500 ج.م', 'عجلة رياضية', '#512497'),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

Widget ProfitCardGreen(
  String GR3,
  String GR2,
  String GR1C1,
  String GR1C2,
) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(width: 1, color: Colors.grey.shade200)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            GR3,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            GR2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                GR1C1,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                GR1C2,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget ProfitCardOrange(
  String OR3,
  String OR2,
  String OR1C1,
  String OR1C2,
) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(width: 1, color: Colors.grey.shade200)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            OR3,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            OR2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                OR1C1,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                OR1C2,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
