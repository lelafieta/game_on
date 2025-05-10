import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_on/src/features/players/domain/entities/player_entity.dart';
import 'package:game_on/src/features/players/domain/usecases/get_players_by_team_usecase.dart';

part 'fetch_players_team_state.dart';

class FetchPlayersTeamCubit extends Cubit<FetchPlayersTeamState> {
  final GetPlayersByTeamUseCase getPlayersByTeamUseCase;
  FetchPlayersTeamCubit({required this.getPlayersByTeamUseCase})
      : super(FetchPlayersTeamInitial());

  Future<void> getPlayersByTeam(String teamId) async {
    emit(FetchPlayersTeamLoading());

    final result = await getPlayersByTeamUseCase.call(teamId);

    result.fold(
        (failure) => emit(FetchPlayersTeamFailure(error: failure.message)),
        (players) => emit(FetchPlayersTeamLoaded(players: players)));
  }
}
