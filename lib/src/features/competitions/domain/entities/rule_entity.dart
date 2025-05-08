class RulesEntity {
  final List<String> tiebreakers; // Critérios de desempate
  final int matchDuration; // Duração da partida (minutos)
  final int restTime; // Intervalo entre tempos (minutos)
  final int substitutionsAllowed; // Número de substituições permitidas
  final bool drawsAllowed; // Se empates são permitidos

  final bool extraTimeAllowed; // Se prorrogação é permitida
  final int extraTimeDuration; // Duração da prorrogação (minutos)
  final bool penaltyAllowed; // Se pênaltis são permitidos
  final bool homeAndAway; // Jogo de ida e volta

  final int pointsVictory; // Pontos por vitória
  final int pointsDraw; // Pontos por empate
  final int pointsLose; // Pontos por derrota

  final int maxPlayers; // Número máximo de jogadores por equipe
  final DateTime? registrationDeadline; // Data limite de inscrição
  final bool foreignPlayers; // Permite jogadores estrangeiros?
  final List<String> punishments; // Regras de punição ou sanções

  final String createdBy; // UUID do criador

  RulesEntity({
    required this.tiebreakers,
    required this.matchDuration,
    required this.restTime,
    required this.substitutionsAllowed,
    required this.drawsAllowed,
    required this.extraTimeAllowed,
    required this.extraTimeDuration,
    required this.penaltyAllowed,
    required this.homeAndAway,
    required this.pointsVictory,
    required this.pointsDraw,
    required this.pointsLose,
    required this.maxPlayers,
    this.registrationDeadline,
    required this.foreignPlayers,
    required this.punishments,
    required this.createdBy,
  });
}
