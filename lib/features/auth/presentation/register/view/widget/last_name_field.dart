import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../domain/validators/auth.dart';
import '../../../../domain/validators/enums/name_valid_state.dart';

class LastNameField extends StatelessWidget {
  const LastNameField({
    required TextEditingController controller,
    super.key,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      inputFormatters: [
        // ignore spaces.
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      validator: (value) {
        final state = AuthValidator.validName(value);
        switch (state) {
          case NameValidState.valid:
            return null;
          case NameValidState.notValid:
            return '3 حروف على الأقل';
          case NameValidState.cannotBeEmpty:
            return 'هذا الحقل مطلوب';
        }
      },
      style: const TextStyle(color: AppColors.white),
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'إسم العائلة',
        errorStyle: TextStyle(color: AppColors.appRed),
      ),
    );
  }
}
