import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            return 'بريد إلكتروني غير صالح';
          case EmailValidState.cannotBeEmpty:
            return 'هذا الحقل مطلوب';
        }
      },
      // style: const TextStyle(fontSize: 12),
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: 'البريد الإلكتروني',
        hintText: 'أكتب بريدك الإلكتروني هنا',
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        errorStyle: TextStyle(color: Colors.red),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }
}
