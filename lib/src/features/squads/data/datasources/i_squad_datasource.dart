import 'package:dartz/dartz.dart';

import '../models/squad_model.dart';

abstract class ISquadRemoteDataSource {
  Future<Unit> createSquad(SquadModel squad);
  Future<List<SquadModel>> getSquadsByTeam(String teamId);
}
