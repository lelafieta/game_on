import 'package:dartz/dartz.dart';
import 'package:game_on/src/core/error/failure.dart';
import 'package:game_on/src/features/competitions/domain/entities/prizes_entity.dart';
import 'package:game_on/src/features/competitions/domain/repositories/i_prizes_repository.dart';

import '../../../../core/usecases/base_usecases.dart';

class GetPrizesByCompetitionUseCase extends BaseUseCases<PrizesEntity, int> {
  final IPrizesRepository prizesRepository;

  GetPrizesByCompetitionUseCase({required this.prizesRepository});

  @override
  Future<Either<Failure, PrizesEntity>> call(int params) async {
    return await prizesRepository.getPrizesByCompetition(competitionId: params);
  }
}
