import 'package:dartz/dartz.dart';
import 'package:game_on/src/core/error/failure.dart';

import '../../../../core/usecases/base_usecases.dart';
import '../entities/rule_entity.dart';
import '../repositories/i_rules_repository.dart';

class GetRulesByCompetitionUseCase extends BaseUseCases<RulesEntity, int> {
  final IRulesRepository rulesRepository;

  GetRulesByCompetitionUseCase({required this.rulesRepository});

  @override
  Future<Either<Failure, RulesEntity>> call(int params) async {
    return await rulesRepository.getRulesByCompetition(competitionId: params);
  }
}
