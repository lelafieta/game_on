import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/starting_lineup_player_model.dart';
import 'i_starting_lineup_player_datasource.dart';

class StartingLineupPlayerRemoteDataSource
    extends IStartingLineupPlayerRemoteDataSource {
  final SupabaseClient client;

  StartingLineupPlayerRemoteDataSource({required this.client});

  @override
  Future<List<StartingLineupPlayersModel>> createStartingLineupPlayer(
    StartingLineupPlayersModel startingLineupPlayer,
  ) async {
    final teamId = startingLineupPlayer.teamId;
    final playerId = startingLineupPlayer.playerId;
    final positionIndex = startingLineupPlayer.positionIndex;

    // 1. Verifica se já existe
    final existing = await client
        .from('starting_lineup_players')
        .select()
        .eq('team_id', teamId)
        .eq('player_id', playerId)
        .maybeSingle();

    // 2. Se existir, deleta
    if (existing != null) {
      final existingId = existing['id'];
      await client
          .from('starting_lineup_players')
          .delete()
          .eq('id', existingId);
    }

    final existingPosition = await client
        .from('starting_lineup_players')
        .select()
        .eq('team_id', teamId)
        .eq('position_index', positionIndex)
        .limit(1)
        .then((res) => (res as List).isNotEmpty ? res.first : null);

    if (existingPosition != null) {
      final existingId = existingPosition['id'];
      await client
          .from('starting_lineup_players')
          .delete()
          .eq('id', existingId);
    }

    // 3. Inserção
    await client
        .from('starting_lineup_players')
        .insert(startingLineupPlayer.toMap());

    return await getTeamStartingLineupPlayers(teamId);
  }

  @override
  Future<List<StartingLineupPlayersModel>> getTeamStartingLineupPlayers(
      String teamId) async {
    final response = await client
        .from('starting_lineup_players')
        .select('*, players:players(*), team:teams(*)')
        .eq('team_id', teamId);

    final data = response as List;

    return data
        .map((item) => StartingLineupPlayersModel.fromMap(item))
        .toList();
  }
}
