import '../../domain/entities/team_entity.dart';

class TeamModel extends TeamEntity {
  const TeamModel({
    super.id,
    super.name,
    super.logoUrl,
    super.description,
    super.category,
    super.location,
    super.captainName,
    super.captainContact,
    super.memberLimit,
    super.foundedAt,
    super.inviteCode,
    super.socialLinks,
    super.status,
    super.createdBy,
    super.createdAt,
    super.equipmentType,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      logoUrl: json['logo_url'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      location: json['location'] as String?,
      captainName: json['captain_name'] as String?,
      captainContact: json['captain_contact'] as String?,
      memberLimit: json['member_limit'] as int?,
      foundedAt: json['founded_at'] != null
          ? DateTime.tryParse(json['founded_at'])
          : null,
      inviteCode: json['invite_code'] as String?,
      socialLinks: json['social_links'] as Map<String, dynamic>?,
      status: json['status'] as String?,
      createdBy: json['created_by'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      equipmentType: json['equipment_type'] as String?,
    );
  }

  factory TeamModel.fromEntity(TeamEntity entity) {
    return TeamModel(
      id: entity.id,
      name: entity.name,
      logoUrl: entity.logoUrl,
      description: entity.description,
      category: entity.category,
      location: entity.location,
      captainName: entity.captainName,
      captainContact: entity.captainContact,
      memberLimit: entity.memberLimit,
      foundedAt: entity.foundedAt,
      inviteCode: entity.inviteCode,
      socialLinks: entity.socialLinks,
      status: entity.status,
      createdBy: entity.createdBy,
      createdAt: entity.createdAt,
      equipmentType: entity.equipmentType,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo_url': logoUrl,
      'description': description,
      'category': category,
      'location': location,
      'captain_name': captainName,
      'captain_contact': captainContact,
      'member_limit': memberLimit,
      'founded_at': foundedAt?.toIso8601String(),
      'invite_code': inviteCode,
      'social_links': socialLinks,
      'status': status,
      'created_by': createdBy,
      'created_at': createdAt?.toIso8601String(),
      'equipment_type': equipmentType,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo_url': logoUrl,
      'description': description,
      'category': category,
      'location': location,
      'captain_name': captainName,
      'captain_contact': captainContact,
      'member_limit': memberLimit,
      'founded_at': foundedAt?.toIso8601String(),
      'invite_code': inviteCode,
      'social_links': socialLinks,
      'status': status,
      'created_by': createdBy,
      'created_at': createdAt?.toIso8601String(),
      'equipment_type': equipmentType,
    };
  }
}
