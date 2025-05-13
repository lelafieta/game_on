import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/starting_lineup_player_model.dart';
import 'i_starting_lineup_player_datasource.dart';

class StartingLineupPlayerRemoteDataSource
    extends IStartingLineupPlayerRemoteDataSource {
  final SupabaseClient client;

  StartingLineupPlayerRemoteDataSource({required this.client});

  @override
  Future<List<StartingLineupPlayersModel>> createStartingLineupPlayer(
      StartingLineupPlayersModel startingLineupPlayer) async {
    // Inserção
    final insertResponse = await client
        .from('starting_lineup_players')
        .insert(startingLineupPlayer.toMap())
        .select('*, players:profiles(*), team:teams(*)');

    final data = insertResponse as List;

    return data
        .map((item) => StartingLineupPlayersModel.fromMap(item))
        .toList();
  }

  @override
  Future<List<StartingLineupPlayersModel>> getTeamStartingLineupPlayers(
      String teamId) async {
    final response = await client
        .from('starting_lineup_players')
        .select('*, players:profiles(*), team:teams(*)')
        .eq('team_id', teamId);

    final data = response as List;

    return data
        .map((item) => StartingLineupPlayersModel.fromMap(item))
        .toList();
  }
}
