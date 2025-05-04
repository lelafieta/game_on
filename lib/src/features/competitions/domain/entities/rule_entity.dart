class RulesEntity {
  final List<String> tiebreakers;
  final String pointSystem;
  final String matchFormat;
  final String matchLeg;
  final int maxSubs;
  final bool extraSubsEt;
  final String matchDuration;
  final bool extraTime;
  final bool penalties;
  final int maxPlayers;
  final DateTime? registrationDeadline;
  final bool foreignPlayers;
  final List<String> punishments;

  RulesEntity({
    required this.tiebreakers,
    required this.pointSystem,
    required this.matchFormat,
    required this.matchLeg,
    required this.maxSubs,
    required this.extraSubsEt,
    required this.matchDuration,
    required this.extraTime,
    required this.penalties,
    required this.maxPlayers,
    this.registrationDeadline,
    required this.foreignPlayers,
    required this.punishments,
  });
}
