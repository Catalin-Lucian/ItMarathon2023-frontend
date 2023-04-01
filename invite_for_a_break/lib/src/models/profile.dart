class Profile {
  // final String profileImage;
  final int userId;
  final int profileId;
  final String firstName;
  final String lastName;
  final String departament;
  final String oficeName;
  final String teamName;
  final String floorNumber;

  Profile({
    // required this.profileImage,
    required this.userId,
    required this.profileId,
    required this.firstName,
    required this.lastName,
    required this.departament,
    required this.oficeName,
    required this.teamName,
    required this.floorNumber,
  });

  Profile copyWith({
    // String? profileImage,
    int? userId,
    int? profileId,
    String? firstName,
    String? lastName,
    String? departament,
    String? oficeName,
    String? teamName,
    String? floorNumber,
  }) {
    return Profile(
      // profileImage: profileImage ?? this.profileImage,
      userId: userId ?? this.userId,
      profileId: profileId ?? this.profileId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      departament: departament ?? this.departament,
      oficeName: oficeName ?? this.oficeName,
      teamName: teamName ?? this.teamName,
      floorNumber: floorNumber ?? this.floorNumber,
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      // profileImage: json['profileImage'],
      userId: json['user_id'] as int,
      profileId: json['profile_id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      departament: json['dept'] as String,
      oficeName: json['office_name'] as String,
      teamName: json['team_name'] as String,
      floorNumber: json['floor_number'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'profileImage': profileImage,
      'user_id': userId,
      'profile_id': profileId,
      'first_name': firstName,
      'last_name': lastName,
      'dept': departament,
      'office_name': oficeName,
      'team_name': teamName,
      'floor_number': floorNumber,
    };
  }
}
