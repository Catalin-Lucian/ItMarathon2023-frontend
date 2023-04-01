import 'package:invite_for_a_break/src/models/search_user.dart';

class HomepageRepo {
  Future<List<SearchUser>> getUsers() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      SearchUser(name: 'John Doe', email: 'test@gmail.com'),
      SearchUser(name: 'Costica', email: 'test2@gmail.com')
    ];
  }

  Future<List<SearchUser>> searchUsers(String searchString) async {
    await Future.delayed(Duration(seconds: 2));
    return [SearchUser(name: 'Costica', email: 'test2@gmail.com')];
  }
}
