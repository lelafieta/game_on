import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecases.dart';
import '../entities/team_entity.dart';
import '../repositories/i_team_repository.dart';

class GetTeamsUseCase extends BaseUseCases<List<TeamEntity>, TeamEntity> {
  final ITeamRepository teamRepository;

  GetTeamsUseCase({required this.teamRepository});
  @override
  Future<Either<Failure, List<TeamEntity>>> call(TeamEntity params) async {
    return await teamRepository.getMyTeams();
  }
}

abstract class UpdateTeamParams {
  String? id;
  TeamEntity? team;
}
