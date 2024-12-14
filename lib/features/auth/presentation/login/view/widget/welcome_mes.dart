import 'package:flutter/material.dart';

class WelcomeMes extends StatelessWidget {
  const WelcomeMes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.75,
          child: const Text(
            "مرحبًا، لنقم بتسجيل الدخول ونبدأ!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              height: 2,
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
