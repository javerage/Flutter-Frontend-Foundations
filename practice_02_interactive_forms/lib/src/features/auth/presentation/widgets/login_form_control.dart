import 'package:flutter/material.dart';
import 'loading_border_button.dart';
import 'login_form_fields.dart';

class LoginFormControl extends StatelessWidget {
  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final void Function(String) onPasswordSubmitted;
  final bool isRememberMeChecked;
  final void Function(bool?)? onRememberMeChanged;
  final bool isLoading;
  final VoidCallback onSubmit;

  const LoginFormControl({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
    required this.passwordController,
    required this.passwordFocusNode,
    required this.onPasswordSubmitted,
    required this.isRememberMeChecked,
    required this.onRememberMeChanged,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginFormFields(
          emailController: emailController,
          emailFocusNode: emailFocusNode,
          passwordController: passwordController,
          passwordFocusNode: passwordFocusNode,
          onPasswordSubmitted: onPasswordSubmitted,
        ),
        const SizedBox(height: 16),
        CheckboxListTile(
          title: const Text('Remember Me'),
          value: isRememberMeChecked,
          onChanged: onRememberMeChanged,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: LoadingBorderButton(
            isLoading: isLoading,
            onPressed: onSubmit,
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }
}
