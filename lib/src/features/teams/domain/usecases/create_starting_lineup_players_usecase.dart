import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecases.dart';
import '../entities/starting_lineup_player_entity.dart';
import '../repositories/i_starting_lineup_player_repository.dart';

class CreateTeamStartingLineupPlayersUseCase extends BaseUseCases<
    List<StartingLineupPlayerEntity>, StartingLineupPlayerEntity> {
  final IStartingLineupPlayerRepository startingLineupPlayerRepository;

  CreateTeamStartingLineupPlayersUseCase(
      {required this.startingLineupPlayerRepository});

  @override
  Future<Either<Failure, List<StartingLineupPlayerEntity>>> call(
      StartingLineupPlayerEntity params) {
    return startingLineupPlayerRepository.createStartingLineupPlayer(params);
  }
}
