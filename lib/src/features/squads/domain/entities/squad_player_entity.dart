class SquadPlayerEntity {
  final String? id;
  final String? squadId;
  final String? playerId;
  final String? tacticalPosition;
  final int? jerseyNumber;
  final bool? isStarter;

  SquadPlayerEntity({
    required this.id,
    required this.squadId,
    required this.playerId,
    required this.tacticalPosition,
    required this.jerseyNumber,
    required this.isStarter,
  });
}
