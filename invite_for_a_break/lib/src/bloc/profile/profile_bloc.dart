import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/form_submision_status.dart';
import 'package:invite_for_a_break/src/bloc/profile/profile_event.dart';
import 'package:invite_for_a_break/src/bloc/profile/profile_state.dart';
import 'package:invite_for_a_break/src/models/profile.dart';
import 'package:invite_for_a_break/src/repository/profile_repo.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;

  ProfileBloc({required this.profileRepo}) : super(ProfileState()) {
    on<ProfileEvent>(_onEvent);
  }

  Future<void> _onEvent(ProfileEvent event, Emitter<ProfileState> emit) async {
    // first load profile data
    if (event is ProfileLoading) {
      try {
        final profile = await profileRepo.getProfile(event.userId);
        emit(state.copyWith(
            firstName: profile.firstName,
            lastName: profile.lastName,
            departament: profile.departament,
            oficeName: profile.oficeName,
            teamName: profile.teamName,
            floorNumber: profile.floorNumber,
            formStatus: InitialFormStatus()));
      } catch (e) {
        print("Error: $e");
      }
      // profile image changed
      // } else if (event is ProfileImageChanged) {
      //   emit(state.copyWith(profileImage: event.image));

      // first name changed
    } else if (event is ProfileFirstNameChanged) {
      emit(state.copyWith(firstName: event.firstName, hasChanged: true));
    } else if (event is ProfileLastNameChanged) {
      emit(state.copyWith(lastName: event.lastName, hasChanged: true));
    } else if (event is ProfileDepartamentChanged) {
      emit(state.copyWith(departament: event.departament, hasChanged: true));
    } else if (event is ProfileOficeNameChanged) {
      emit(state.copyWith(oficeName: event.oficeName, hasChanged: true));
    } else if (event is ProfileTeamNameChanged) {
      emit(state.copyWith(teamName: event.teamName, hasChanged: true));
    } else if (event is ProfileFloorNumberChanged) {
      emit(state.copyWith(floorNumber: event.floorNumber, hasChanged: true));

      // submit profile data
    } else if (event is ProfileSubmited) {
      emit(state.copyWith(formStatus: FormSubmittingStatus()));
      try {
        await profileRepo.updateProfile(Profile(
            userId: state.userId,
            profileId: state.profileId,
            firstName: state.firstName,
            lastName: state.lastName,
            departament: state.departament,
            oficeName: state.oficeName,
            teamName: state.teamName,
            floorNumber: state.floorNumber));
        emit(state.copyWith(
            formStatus: SubmissionSuccessStatus(), hasChanged: false));
      } catch (e) {
        emit(state.copyWith(
            formStatus: SubmissionFailedStatus(
                e.toString().replaceAll("Exception: ", ""))));
      }
    }
  }
}
