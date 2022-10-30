part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfile extends ProfileEvent {
  final String userId;

  GetProfile(this.userId);
}

class UpdateProfile extends ProfileEvent {
  final Map<String, String> values;

  UpdateProfile(this.values);
}

class DeleteProfile extends ProfileEvent {
  final String userId;

  DeleteProfile(this.userId);
}
