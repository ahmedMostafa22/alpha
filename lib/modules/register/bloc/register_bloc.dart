import 'package:alpha/exceptions/exception_handler.dart';
import 'package:alpha/helpers/snackbar.dart';
import 'package:alpha/modules/profile/models/user.dart';
import 'package:alpha/modules/register/repository/register_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is Register) {
        emit(RegisterLoading());
        await RegisterRepository()
            .register(event.user)
            .then((result) => result.fold((e) {
                  Widget exceptionWidget =
                      ExceptionHandler.getExceptionWidget(e, () => add(event));
                  Get.dialog(exceptionWidget);
                  emit(RegisterInitial());
                }, (r) {
              GetSnackBarHelper.showSuccessSnackBar('Signup Success', 'User signed up successfully');
                  emit(RegisterInitial());
                }));
      }
    });
  }
}
