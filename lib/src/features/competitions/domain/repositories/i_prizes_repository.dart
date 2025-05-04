import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/prizes_entity.dart';

abstract class IPrizesRepository {
  Future<Either<Failure, Unit>> savePrizes({required PrizesEntity prizes});
  Future<Either<Failure, PrizesEntity>> getPrizes();
  Future<Either<Failure, PrizesEntity>> getPrizesByCompetition(
      {required int competitionId});
}
