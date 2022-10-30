part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login with LoginEvent {
  final String username, password;

  Login(this.username, this.password);
}
