part of 'login_cubit.dart';

sealed class LoginState {
  final bool isRememberMeChecked;

  const LoginState({this.isRememberMeChecked = false});
}

final class LoginInitial extends LoginState {
  const LoginInitial({super.isRememberMeChecked});
}

final class LoginLoading extends LoginState {
  const LoginLoading({required super.isRememberMeChecked});
}

final class LoginSuccess extends LoginState {
  const LoginSuccess({required super.isRememberMeChecked});
}

final class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error, required super.isRememberMeChecked});
}
