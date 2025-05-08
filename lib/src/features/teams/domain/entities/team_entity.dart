class TeamEntity {
  final String? id;
  final String? name;
  final String? logoUrl;
  final String? description;
  final String? category;
  final String? location;
  final String? captainName;
  final String? captainContact;
  final int? memberLimit;
  final DateTime? foundedAt;
  final String? inviteCode;
  final Map<String, dynamic>? socialLinks;
  final String? status;
  final String? createdBy;
  final DateTime? createdAt;
  final String? equipmentType;
  final String? abbreviation;

  const TeamEntity(
      {this.id,
      this.name,
      this.logoUrl,
      this.description,
      this.category,
      this.location,
      this.captainName,
      this.captainContact,
      this.memberLimit,
      this.foundedAt,
      this.inviteCode,
      this.socialLinks,
      this.status,
      this.createdBy,
      this.createdAt,
      this.equipmentType,
      this.abbreviation});
}
