class SearchUser {
  final String name;
  final String email;

  SearchUser({
    required this.name,
    required this.email,
  });

  factory SearchUser.fromJson(Map<String, dynamic> json) {
    return SearchUser(
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}
