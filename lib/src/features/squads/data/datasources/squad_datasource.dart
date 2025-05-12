import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/squad_model.dart';
import 'i_squad_datasource.dart';

class SquadRemoteDataSource extends ISquadRemoteDataSource {
  final SupabaseClient client;

  SquadRemoteDataSource({required this.client});

  @override
  Future<SquadModel> createSquad(SquadModel squad) async {
    await client.from('squads').insert(squad.toMap());
    return squad;
  }

  @override
  Future<List<SquadModel>> getSquadsByTeam(String teamId) async {
    final res = await client
        .from('squads')
        .select('*, squad_players(*)')
        .eq('team_id', teamId);

    return (res as List)
        .map((json) => SquadModel.fromMap({
              ...json,
              'players': json['squad_players'],
            }))
        .toList();
  }
}
