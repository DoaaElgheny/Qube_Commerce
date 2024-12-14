import 'package:flutter/material.dart';

import '../../../../../../shared/widget/loading_btn.dart';

class ContinueBtn extends StatelessWidget {
  const ContinueBtn({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      onTap: onTap,
      name: 'التالى',
    );
  }
}
