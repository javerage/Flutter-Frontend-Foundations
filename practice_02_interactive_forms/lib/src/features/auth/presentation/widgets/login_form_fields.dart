import 'package:flutter/material.dart';
import 'package:practice_02_interactive_forms/src/core/widgets/custom_text_form_field.dart';

class LoginFormFields extends StatelessWidget {
  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final void Function(String) onPasswordSubmitted;

  const LoginFormFields({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
    required this.passwordController,
    required this.passwordFocusNode,
    required this.onPasswordSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          focusNode: emailFocusNode,
          labelText: 'Email Address',
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(passwordFocusNode);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            final emailRegex =
                RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
            if (!emailRegex.hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: passwordController,
          focusNode: passwordFocusNode,
          labelText: 'Password',
          isPassword: true,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: onPasswordSubmitted,
          validator: (value) {
            if (value == null || value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ],
    );
  }
}
