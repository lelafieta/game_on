import '../../../profiles/data/models/profile_model.dart';
import '../../domain/entities/player_entity.dart';

class PlayerModel extends PlayerEntity {
  const PlayerModel({
    super.id,
    super.teamId,
    super.createdBy,
    super.fullName,
    super.nickname,
    super.shirtNumber,
    super.position,
    super.nationality,
    super.birthDate,
    super.heightCm,
    super.weightKg,
    super.foot,
    super.avatarUrl,
    super.status,
    super.createdAt,
    super.updatedAt,
    super.createdByProfile,
  });

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['id'] as String?,
      teamId: map['team_id'] as String?,
      createdBy: map['created_by'] as String?,
      fullName: map['full_name'] as String?,
      nickname: map['nickname'] as String?,
      shirtNumber: map['shirt_number'] as int?,
      position: map['position'] as String?,
      nationality: map['nationality'] as String?,
      birthDate: map['birth_date'] != null
          ? DateTime.tryParse(map['birth_date'])
          : null,
      heightCm: map['height_cm'] as int?,
      weightKg: map['weight_kg'] as int?,
      foot: map['foot'] as String?,
      avatarUrl: map['avatar_url'] as String?,
      status: map['status'] as String?,
      createdAt: map['created_at'] != null
          ? DateTime.tryParse(map['created_at'])
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.tryParse(map['updated_at'])
          : null,
      createdByProfile: map['created_by_profile'] != null
          ? ProfileModel.fromJson(map['created_by_profile'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'team_id': teamId,
      'created_by': createdBy,
      'full_name': fullName,
      'nickname': nickname,
      'shirt_number': shirtNumber,
      'position': position,
      'nationality': nationality,
      'birth_date': birthDate?.toIso8601String(),
      'height_cm': heightCm,
      'weight_kg': weightKg,
      'foot': foot,
      'avatar_url': avatarUrl,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
