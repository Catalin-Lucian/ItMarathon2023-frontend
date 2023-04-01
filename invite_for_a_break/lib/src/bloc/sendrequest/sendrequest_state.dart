// ignore_for_file: non_constant_identifier_names

import 'package:invite_for_a_break/src/bloc/form_submision_status.dart';

class SendState {
  final String date;
  final String time_interval_start;
  final String time_interval_end;
  final String place;
  final String comment;
  final List<int> users;

  final FormSubmissionStatus formStatus;

  SendState({
    this.date = '',
    this.time_interval_start = '',
    this.time_interval_end = '',
    this.place = '',
    this.comment = '',
    this.users = const [],
    this.formStatus = const InitialFormStatus(),
  });

  SendState copyWith({
    String? date,
    String? time_interval_start,
    String? time_interval_end,
    String? place,
    String? comment,
    List<int>? users,
    FormSubmissionStatus? formStatus,
  }) {
    return SendState(
      date: date ?? this.date,
      time_interval_start: time_interval_start ?? this.time_interval_start,
      time_interval_end: time_interval_end ?? this.time_interval_end,
      place: place ?? this.place,
      comment: comment ?? this.comment,
      users: users ?? this.users,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
