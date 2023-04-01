class SearchUser {
  final String name;
  final String email;
  final int? id;

  SearchUser({
    required this.name,
    required this.email,
    required this.id,
  });

  factory SearchUser.fromJson(Map<String, dynamic> json) {
    return SearchUser(
        name: json['name'] as String,
        email: json['email'] as String,
        id: json['user_id'] as int?);
  }
}
