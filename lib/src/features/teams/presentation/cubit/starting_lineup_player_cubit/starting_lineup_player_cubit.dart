import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/starting_lineup_player_entity.dart';
import '../../../domain/usecases/create_starting_lineup_players_usecase.dart';
import '../../../domain/usecases/get_team_starting_lineup_players_usecase.dart';
part 'starting_lineup_player_state.dart';

class StartingLineupPlayerCubit extends Cubit<StartingLineupPlayerState> {
  final CreateTeamStartingLineupPlayersUseCase
      createTeamStartingLineupPlayersUseCase;
  final GetTeamStartingLineupPlayersUseCase getTeamStartingLineupPlayersUseCase;
  StartingLineupPlayerCubit(
      {required this.createTeamStartingLineupPlayersUseCase,
      required this.getTeamStartingLineupPlayersUseCase})
      : super(StartingLineupPlayerInitial());

  Future<void> createStartingLineupPlayer(
      StartingLineupPlayersEntity startingLineupPlayers) async {
    emit(StartingLineupPlayerLoading());

    final result = await createTeamStartingLineupPlayersUseCase
        .call(startingLineupPlayers);

    result.fold(
        (failure) => emit(StartingLineupPlayerFilure(error: failure.message)),
        (startingLineupPlayers) => emit(StartingLineupPlayerLoaded(
            startingLineupPlayers: startingLineupPlayers)));
  }

  Future<void> getTeamStartingLineupPlayers(String teamId) async {}
}
