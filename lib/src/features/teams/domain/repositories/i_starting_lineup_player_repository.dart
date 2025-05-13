import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/starting_lineup_player_entity.dart';

abstract class IStartingLineupPlayerRepository {
  Future<Either<Failure, List<StartingLineupPlayerEntity>>>
      getTeamStartingLineupPlayers(String teamId);
  Future<Either<Failure, List<StartingLineupPlayerEntity>>>
      updateStartingLineupPlayer(
          StartingLineupPlayerEntity startingLineupPlayer);

  Future<Either<Failure, List<StartingLineupPlayerEntity>>>
      createStartingLineupPlayer(
          StartingLineupPlayerEntity startingLineupPlayer);
}
