import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_02_interactive_forms/src/features/auth/application/login_cubit.dart';
import 'package:practice_02_interactive_forms/src/features/auth/presentation/widgets/login_form_control.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: const LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
            _emailController.text,
            _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('Acceso correcto')));
          // TODO: Navegar a la pantalla principal
        } else if (state is LoginFailure) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Row(
                children: [
                  Icon(Icons.error, color: Theme.of(context).colorScheme.error),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text('Error de Autenticación'),
                  ),
                ],
              ),
              content: Text(state.error),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Aceptar'),
                ),
              ],
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
                child: Image.asset('assets/images/logo_app_001.png'),
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return AbsorbPointer(
                      absorbing: state is LoginLoading,
                      child: LoginFormControl(
                        emailController: _emailController,
                        emailFocusNode: _emailFocusNode,
                        passwordController: _passwordController,
                        passwordFocusNode: _passwordFocusNode,
                        onPasswordSubmitted: (_) => _submitForm(),
                        isRememberMeChecked: state.isRememberMeChecked,
                        onRememberMeChanged: (newValue) {
                          context
                              .read<LoginCubit>()
                              .toggleRememberMe(newValue ?? false);
                        },
                        isLoading: state is LoginLoading,
                        onSubmit: _submitForm,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
