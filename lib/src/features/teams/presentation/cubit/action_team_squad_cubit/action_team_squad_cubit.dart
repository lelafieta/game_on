import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/team_entity.dart';
import '../../../domain/usecases/create_team_usecase.dart';
import '../../../domain/usecases/update_team_usecase.dart';

part 'action_team_squad_state.dart';

class ActionTeamSquadCubit extends Cubit<ActionTeamSquadState> {
  final CreateTeamUseCase createTeamUseCase;
  final UpdateTeamUseCase updateTeamUseCase;

  ActionTeamSquadCubit({
    required this.createTeamUseCase,
    required this.updateTeamUseCase,
  }) : super(ActionTeamSquadInitial());

  Future<void> updateTeamSquad(TeamEntity team) async {
    emit(ActionTeamSquadLoading());

    final result = await updateTeamUseCase.call(team);

    result.fold(
        (failure) => emit(ActionTeamSquadFailure(error: failure.message)),
        (success) => emit(const ActionTeamSquadSuccess(message: "message")));
  }
}
