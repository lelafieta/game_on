import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecases.dart';
import '../entities/starting_lineup_player_entity.dart';
import '../repositories/i_starting_lineup_player_repository.dart';

class GetTeamStartingLineupPlayersUseCase
    extends BaseUseCases<List<StartingLineupPlayerEntity>, String> {
  final IStartingLineupPlayerRepository startingLineupPlayerRepository;

  GetTeamStartingLineupPlayersUseCase(
      {required this.startingLineupPlayerRepository});

  @override
  Future<Either<Failure, List<StartingLineupPlayerEntity>>> call(
      String params) {
    return startingLineupPlayerRepository.getTeamStartingLineupPlayers(params);
  }
}
