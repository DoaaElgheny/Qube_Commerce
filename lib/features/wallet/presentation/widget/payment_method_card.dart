import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class PaymentMethodCard extends StatelessWidget {
  final String label;
  final String img;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodCard({
    required this.label,
    required this.img,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppColors.primaryColor : Colors.white,
        ),
        child: Card(
          margin: EdgeInsets.all(3),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset("assets/images_new$img",
                width: MediaQuery.of(context).size.width * 0.27, height: 80),
          ),
        ),
      ),
    );
  }
}