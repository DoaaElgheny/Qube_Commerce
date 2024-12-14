import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../domain/validators/auth.dart';
import '../../../../domain/validators/enums/email_valid_state.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    required TextEditingController controller,
    super.key,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        // ignore spaces.
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      validator: (value) {
        final state = AuthValidator.validEmail(value);
        switch (state) {
          case EmailValidState.valid:
            return null;
          case EmailValidState.notValid:
            return 'بريد إلكترونى غير صالح';
          case EmailValidState.cannotBeEmpty:
            return 'هذا الحقل مطلوب';
        }
      },
      style: const TextStyle(color: AppColors.white),
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'البريد الإلكترونى',
        errorStyle: TextStyle(color: AppColors.appRed),
      ),
    );
  }
}
