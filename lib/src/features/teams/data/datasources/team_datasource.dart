import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/team_model.dart';
import 'i_team_datasource.dart';

class TeamRemoteDataSourceImpl implements ITeamRemoteDataSource {
  final SupabaseClient client;

  TeamRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> createTeam(TeamModel team) async {
    final response = await client.from('teams').insert(team.toMap());
    if (response.error != null) {
      throw Exception('Erro ao criar equipe: ${response.error!.message}');
    }
    return unit;
  }

  @override
  Future<List<TeamModel>> getTeams() async {
    final response = await client.from('teams').select();

    final data = response as List<dynamic>;
    return data.map((item) => TeamModel.fromJson(item)).toList();
  }

  @override
  Future<List<TeamModel>> getMyTeams() async {
    final response = await client.from('teams').select();

    final data = response as List<dynamic>;
    return data.map((item) => TeamModel.fromJson(item)).toList();
  }

  @override
  Future<TeamModel?> getTeamById(String id) async {
    final response = await client.from('teams').select().eq('id', id).single();

    return TeamModel.fromJson(response);
  }

  @override
  Future<Unit> updateTeam(TeamModel team) async {
    await client.from('teams').update(team.toMap()).eq('id', team.id!);
    return unit;
  }

  @override
  Future<Unit> deleteTeam(String id) async {
    final response = await client.from('teams').delete().eq('id', id);
    return unit;
  }
}
