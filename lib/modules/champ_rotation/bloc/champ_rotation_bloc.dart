import 'package:alpha/exceptions/exception_handler.dart';
import 'package:alpha/modules/champ_rotation/models/champion.dart';
import 'package:alpha/modules/champ_rotation/repository/champ_rotation_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'champ_rotation_event.dart';
part 'champ_rotation_state.dart';

class ChampRotationBloc extends Bloc<ChampRotationEvent, ChampRotationState> {
  ChampRotationBloc() : super(ChampRotationInitial()) {
    on<ChampRotationEvent>((event, emit) async {
      try {
        if (event is GetChampionRotation) {
          emit(ChampRotationLoading());
          List<Champion> champs = (await ChampRotationRepository()
              .getChampionRotation()) as List<Champion>;
          emit(ChampRotationLoaded(champs));
        }
      } catch (e) {
        emit(ChampRotationError(ExceptionHandler.getExceptionWidget(e)));
        print(e.toString());
      }
    });
  }
}
