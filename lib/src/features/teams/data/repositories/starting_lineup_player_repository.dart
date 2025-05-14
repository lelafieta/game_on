import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/starting_lineup_player_entity.dart';
import '../../domain/repositories/i_starting_lineup_player_repository.dart';
import '../datasources/i_starting_lineup_player_datasource.dart';
import '../models/starting_lineup_player_model.dart';

class StartingLineupPlayerRepository extends IStartingLineupPlayerRepository {
  final IStartingLineupPlayerRemoteDataSource startingLineupPlayerDataSource;

  StartingLineupPlayerRepository(
      {required this.startingLineupPlayerDataSource});

  @override
  Future<Either<Failure, List<StartingLineupPlayersModel>>>
      createStartingLineupPlayer(
    StartingLineupPlayersEntity startingLineupPlayer,
  ) async {
    try {
      final result =
          await startingLineupPlayerDataSource.createStartingLineupPlayer(
              StartingLineupPlayersModel.fromEntity(startingLineupPlayer));
      return Right(result);
    } catch (e) {
      print(e);
      return Left(Failure(
          message: 'Erro ao criar jogador do 11 inicial: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<StartingLineupPlayersEntity>>>
      getTeamStartingLineupPlayers(
    String teamId,
  ) async {
    try {
      final result = await startingLineupPlayerDataSource
          .getTeamStartingLineupPlayers(teamId);
      return Right(result);
    } catch (e) {
      print("eror 2 $e");
      return Left(Failure(
          message: 'Erro ao buscar escalação inicial: ${e.toString()}'));
    }
  }
}
