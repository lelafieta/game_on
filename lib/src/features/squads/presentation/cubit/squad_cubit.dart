import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/squad_entity.dart';
import '../../domain/usecases/create_squad_usecase.dart';
import '../../domain/usecases/get_squads_by_team_usecase.dart';

part 'squad_state.dart';

class SquadCubit extends Cubit<SquadState> {
  final CreateSquadUseCase createSquadUseCase;
  final GetSquadsByTeamUseCase getSquadsByTeamUseCase;
  SquadCubit(
      {required this.createSquadUseCase, required this.getSquadsByTeamUseCase})
      : super(SquadInitial());

  Future<void> createSquad(SquadEntity squad) async {
    emit(SquadLoading());

    final result = await createSquadUseCase.call(squad);

    result.fold((failure) => emit(SquadFailure(error: failure.message)),
        (squad) => SquadLoaded(squad: squad));
  }

  Future<void> fetchSquadsByTeam(String teamId) async {}
}
