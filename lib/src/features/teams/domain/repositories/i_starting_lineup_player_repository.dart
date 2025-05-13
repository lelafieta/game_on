import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/starting_lineup_player_entity.dart';

abstract class IStartingLineupPlayerRepository {
  Future<Either<Failure, List<StartingLineupPlayersEntity>>>
      getTeamStartingLineupPlayers(String teamId);

  Future<Either<Failure, List<StartingLineupPlayersEntity>>>
      createStartingLineupPlayer(
          StartingLineupPlayersEntity startingLineupPlayer);
}
