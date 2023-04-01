import 'package:invite_for_a_break/src/models/search_user.dart';

class HomepageState {
  final String searchString;
  final List<SearchUser> users;
  List<String> searchHistory;

  HomepageState({
    this.searchString = '',
    this.users = const [],
    this.searchHistory = const [],
  });

  HomepageState copyWith({
    String? searchString,
    List<SearchUser>? users,
    List<String>? searchHistory,
  }) {
    return HomepageState(
      searchString: searchString ?? this.searchString,
      users: users ?? this.users,
      searchHistory: searchHistory ?? this.searchHistory,
    );
  }
}
