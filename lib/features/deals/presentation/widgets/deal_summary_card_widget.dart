import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:qubeCommerce/features/home/presentation/cubit/home_state.dart';
import 'package:qubeCommerce/injection_container.dart';

import '../cubit/join_deal_cubit.dart';

class DealSummaryCardWidget extends StatelessWidget {
  const DealSummaryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JoinDealCubit, JoinDealState>(
      builder: (context, state) {
        final joinDealCubit = JoinDealCubit.get(context);
        return Column(
          children: [
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/png/ConImage2.png'), // Add your image to the assets folder
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset("assets/images/png/Summary.png",
                      height: 23, fit: BoxFit.cover),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    "ملخص الإستثمار",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  ":قيمة الإنضمام",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "ج.م",
                      style: TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      joinDealCubit.dealValue ?? '0',
                      style: const TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "%رسوم الخدمة ${joinDealCubit.serviceFees*100}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textDirection: TextDirection.ltr,
                ),
                Row(
                  children: [
                    const Text(
                      "ج.م",
                      style: TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${joinDealCubit.fees ?? '0'}",
                      style: const TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الخصم",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "ج.م",
                      style: TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "0",
                      style: TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/png/ConImage3.png'), // Add your image to the assets folder
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "الإجمالي",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "ج.م",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "${joinDealCubit.totalDealValue ?? '0'}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
