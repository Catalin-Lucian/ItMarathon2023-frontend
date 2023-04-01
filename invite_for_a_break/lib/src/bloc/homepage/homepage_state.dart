import 'package:invite_for_a_break/src/models/search_user.dart';

class HomepageState {
  final String searchString;
  final List<SearchUser> users;

  HomepageState({
    this.searchString = '',
    this.users = const [],
  });

  HomepageState copyWith({
    String? searchString,
    List<SearchUser>? users,
  }) {
    return HomepageState(
      searchString: searchString ?? this.searchString,
      users: users ?? this.users,
    );
  }
}
