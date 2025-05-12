import '../../domain/entities/squad_entity.dart';
import 'squad_player_model.dart';

class SquadModel extends SquadEntity {
  SquadModel({
    super.id,
    super.teamId,
    super.size,
    super.formation,
    super.players,
  });

  factory SquadModel.fromMap(Map<String, dynamic> map) {
    return SquadModel(
      id: map['id'],
      teamId: map['team_id'],
      size: map['size'],
      formation: map['formation'],
      players: (map['players'] as List)
          .map((p) => SquadPlayerModel.fromMap(p))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'team_id': teamId,
        'size': size,
        'formation': formation,
        'players':
            players?.map((e) => (e as SquadPlayerModel).toMap()).toList(),
      };
}
