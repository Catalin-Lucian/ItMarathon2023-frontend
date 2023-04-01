import 'package:invite_for_a_break/src/models/time_interval.dart';

abstract class SendEvent {}

class SendRequest extends SendEvent {
  final TimeInterval timeInterval;
  final String place;
  final String comment;
  final List<int> users;

  SendRequest({
    required this.timeInterval,
    required this.place,
    required this.comment,
    required this.users,
  });

  Map<String, dynamic> toJson() {
    return {
      'time_interval': timeInterval.toJson(),
      'place': place,
      'comment': comment,
      'users': users,
    };
  }
}

class SendRequestFailed extends SendEvent {}

class SendRequestSuccess extends SendEvent {}

class SendRequestDateChanged extends SendEvent {
  final String date;

  SendRequestDateChanged({required this.date});
}

class SendRequestTimeIntervalStartChanged extends SendEvent {
  final String timeIntervalStart;

  SendRequestTimeIntervalStartChanged({required this.timeIntervalStart});
}

class SendRequestTimeIntervalEndChanged extends SendEvent {
  final String timeIntervalEnd;

  SendRequestTimeIntervalEndChanged({required this.timeIntervalEnd});
}

class SendRequestPlaceChanged extends SendEvent {
  final String place;

  SendRequestPlaceChanged({required this.place});
}

class SendRequestCommentChanged extends SendEvent {
  final String comment;

  SendRequestCommentChanged({required this.comment});
}

class SendRequestUsersChanged extends SendEvent {
  final List<int> users;

  SendRequestUsersChanged({required this.users});
}
