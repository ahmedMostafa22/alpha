part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class Register with RegisterEvent {
  final User user;

  Register(this.user);
}
