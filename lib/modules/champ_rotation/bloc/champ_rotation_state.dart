part of 'champ_rotation_bloc.dart';

@immutable
abstract class ChampRotationState {}

class ChampRotationInitial extends ChampRotationState {}

class ChampRotationLoading extends ChampRotationState {}

class ChampRotationLoaded extends ChampRotationState {
  final List<Champion> champs;

  ChampRotationLoaded(this.champs);
}

class ChampRotationError extends ChampRotationState {
  final Widget errorMessage;

  ChampRotationError(this.errorMessage);
}
