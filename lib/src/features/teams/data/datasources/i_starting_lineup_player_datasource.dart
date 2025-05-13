import '../models/starting_lineup_player_model.dart';

abstract class IStartingLineupPlayerRemoteDataSource {
  Future<List<StartingLineupPlayersModel>> getTeamStartingLineupPlayers(
      String teamId);

  Future<List<StartingLineupPlayersModel>> createStartingLineupPlayer(
      StartingLineupPlayersModel startingLineupPlayer);
}
