import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/homepage/homepage_event.dart';
import 'package:invite_for_a_break/src/bloc/homepage/homepage_state.dart';
import 'package:invite_for_a_break/src/repository/homepage_repo.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final HomepageRepo homepageRepo;

  HomepageBloc({required this.homepageRepo}) : super(HomepageState()) {
    on<HomepageEvent>(_onEvent);
  }

  Future<void> _onEvent(
      HomepageEvent event, Emitter<HomepageState> emit) async {
    if (event is HomepageLoading) {
      try {
        final users = await homepageRepo.getUsers();
        emit(state.copyWith(users: users));
      } catch (e) {
        print("Error: $e");
      }
    } else if (event is HomepageSearchStringChanged) {
      emit(state.copyWith(searchString: event.searchString));
    } else if (event is HomepageSearch) {
      try {
        final users = await homepageRepo.getUsers();
        emit(state.copyWith(users: users));
      } catch (e) {
        print("Error: $e");
      }
    } else if (event is HomeapgeSearchFailed) {
      emit(state.copyWith(users: []));
    }
  }
}
