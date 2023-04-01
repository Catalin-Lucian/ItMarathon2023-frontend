import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/form_submision_status.dart';
import 'package:invite_for_a_break/src/bloc/sendrequest/sendrequest_event.dart';
import 'package:invite_for_a_break/src/bloc/sendrequest/sendrequest_state.dart';
import 'package:invite_for_a_break/src/repository/sendrequest.dart';

class SendBloc extends Bloc<SendEvent, SendState> {
  final SendRequestRepo sendRepo;

  SendBloc({required this.sendRepo}) : super(SendState()) {
    on<SendEvent>(_onEvent);
  }

  Future<void> _onEvent(SendEvent event, Emitter<SendState> emit) async {
    if (event is SendRequest) {
      emit(state.copyWith(formStatus: FormSubmittingStatus()));
      try {
        await Future.delayed(Duration(seconds: 1));
        emit(state.copyWith(formStatus: SubmissionSuccessStatus()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailedStatus(e.toString())));
      }
    } else if (event is SendRequestDateChanged) {
      emit(state.copyWith(date: event.date));
    } else if (event is SendRequestTimeIntervalStartChanged) {
      emit(state.copyWith(time_interval_start: event.timeIntervalStart));
    } else if (event is SendRequestTimeIntervalEndChanged) {
      emit(state.copyWith(time_interval_end: event.timeIntervalEnd));
    } else if (event is SendRequestPlaceChanged) {
      emit(state.copyWith(place: event.place));
    } else if (event is SendRequestCommentChanged) {
      emit(state.copyWith(comment: event.comment));
    } else if (event is SendRequestUsersChanged) {
      emit(state.copyWith(users: event.users));
    }
  }
}
