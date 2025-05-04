import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/rule_entity.dart';

abstract class IRulesRepository {
  Future<Either<Failure, Unit>> saveRules({required RulesEntity rules});
  Future<RulesEntity> getRules();
  Future<Either<Failure, RulesEntity>> getRulesByCompetition(
      {required int competitionId});
}
