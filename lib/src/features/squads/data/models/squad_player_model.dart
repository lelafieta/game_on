import '../../domain/entities/squad_player_entity.dart';

class SquadPlayerModel extends SquadPlayerEntity {
  SquadPlayerModel({
    super.id,
    super.squadId,
    super.playerId,
    super.tacticalPosition,
    super.jerseyNumber,
    super.isStarter,
  });

  factory SquadPlayerModel.fromMap(Map<String, dynamic> map) {
    return SquadPlayerModel(
      id: map['id'],
      squadId: map['squad_id'],
      playerId: map['player_id'],
      tacticalPosition: map['tactical_position'],
      jerseyNumber: map['jersey_number'],
      isStarter: map['is_starter'],
    );
  }

  factory SquadPlayerModel.fromEntity(SquadPlayerEntity entity) {
    return SquadPlayerModel(
      id: entity.id,
      squadId: entity.squadId,
      playerId: entity.playerId,
      tacticalPosition: entity.tacticalPosition,
      jerseyNumber: entity.jerseyNumber,
      isStarter: entity.isStarter,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'squad_id': squadId,
        'player_id': playerId,
        'tactical_position': tacticalPosition,
        'jersey_number': jerseyNumber,
        'is_starter': isStarter,
      };
}
