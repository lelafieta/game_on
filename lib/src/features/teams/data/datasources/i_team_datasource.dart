import 'package:dartz/dartz.dart';

import '../models/team_model.dart';

abstract class ITeamRemoteDataSource {
  Future<Unit> createTeam(TeamModel team);
  Future<List<TeamModel>> getTeams();
  Future<List<TeamModel>> getMyTeams();
  Future<TeamModel?> getTeamById(String id);
  Future<Unit> updateTeam(TeamModel team);
  Future<Unit> deleteTeam(String id);
}
