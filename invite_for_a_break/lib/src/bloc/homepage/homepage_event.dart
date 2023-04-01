import 'package:invite_for_a_break/src/models/search_user.dart';

abstract class HomepageEvent {}

class HomepageLoading extends HomepageEvent {}

class HomepageSearchStringChanged extends HomepageEvent {
  final String searchString;

  HomepageSearchStringChanged({required this.searchString});
}

class HomepageSearch extends HomepageEvent {}

class HomeapgeSearchFailed extends HomepageEvent {}
