import 'package:alpha/exceptions/exception_handler.dart';
import 'package:alpha/helpers/snackbar.dart';
import 'package:alpha/modules/login/repository/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is Login) {
        emit(LoginLoading());
        await LoginRepository().login(event.username, event.password).then(
            (result) => result.fold((e) {
                  Widget exceptionWidget =
                      ExceptionHandler.getExceptionWidget(e, () => add(event));
                  Get.dialog(exceptionWidget);
                },
                    (r) => GetSnackBarHelper.showSuccessSnackBar(
                        'Success', 'Login succeeded')));
        emit(LoginInitial());
      }
    });
  }
}
