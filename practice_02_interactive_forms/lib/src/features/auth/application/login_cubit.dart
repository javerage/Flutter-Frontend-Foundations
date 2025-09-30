import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  void toggleRememberMe(bool newValue) {
    emit(LoginInitial(isRememberMeChecked: newValue));
  }

  Future<void> login(String email, String password) async {
    emit(LoginLoading(isRememberMeChecked: state.isRememberMeChecked));

    await Future.delayed(const Duration(seconds: 5));

    if (email == 'test@javerage.com' && password == '5ecret4') {
      emit(LoginSuccess(isRememberMeChecked: state.isRememberMeChecked));
    } else {
      emit(LoginFailure(
        error: 'Credenciales inválidas. Inténtalo de nuevo.',
        isRememberMeChecked: state.isRememberMeChecked,
      ));
    }
  }
}