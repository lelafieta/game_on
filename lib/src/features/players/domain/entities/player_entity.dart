import 'package:game_on/src/features/profiles/domain/entities/profile_entity.dart';

class PlayerEntity {
  final String? id;
  final String? teamId;
  final String? createdBy;
  final String? fullName;
  final String? nickname;
  final int? shirtNumber;
  final String? position;
  final String? nationality;
  final DateTime? birthDate;
  final int? heightCm;
  final int? weightKg;
  final String? foot;
  final String? avatarUrl;
  final String? status;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ProfileEntity? createdByProfile;

  const PlayerEntity({
    this.id,
    this.teamId,
    this.createdBy,
    this.fullName,
    this.nickname,
    this.shirtNumber,
    this.position,
    this.type,
    this.nationality,
    this.birthDate,
    this.heightCm,
    this.weightKg,
    this.foot,
    this.avatarUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.createdByProfile,
  });
}
