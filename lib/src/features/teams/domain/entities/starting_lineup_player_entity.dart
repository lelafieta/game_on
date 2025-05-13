class StartingLineupPlayersEntity {
  final String id;
  final String teamId;
  final String playerId;
  final DateTime? createdAt;
  final int positionIndex;

  StartingLineupPlayersEntity({
    required this.id,
    required this.teamId,
    required this.playerId,
    this.createdAt,
    required this.positionIndex,
  });
}
