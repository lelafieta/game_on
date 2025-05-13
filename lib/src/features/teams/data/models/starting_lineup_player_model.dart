import '../../domain/entities/starting_lineup_player_entity.dart';

class StartingLineupPlayerModel extends StartingLineupPlayerEntity {
  StartingLineupPlayerModel({
    required super.id,
    required super.teamId,
    required super.playerId,
    required super.createdAt,
    required super.positionIndex,
  });

  factory StartingLineupPlayerModel.fromMap(Map<String, dynamic> map) {
    return StartingLineupPlayerModel(
      id: map['id'] as String,
      teamId: map['team_id'] as String,
      playerId: map['player_id'] as String,
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      positionIndex: (map['position_index'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'team_id': teamId,
      'player_id': playerId,
      'created_at': createdAt?.toIso8601String(),
      'position_index': positionIndex,
    };
  }
}
