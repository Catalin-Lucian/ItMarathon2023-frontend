import 'package:invite_for_a_break/src/bloc/form_submision_status.dart';

class ProfileState {
  final bool myProfile;

  final int userId;
  final int profileId;
  final String profileImage;

  final String firstName;
  final String lastName;
  final String departament;
  final String oficeName;
  final String teamName;
  final String floorNumber;

  final bool hasChanged;
  final FormSubmissionStatus formStatus;

  ProfileState({
    this.myProfile = true,
    this.userId = 0,
    this.profileId = 0,
    this.profileImage = '',
    this.firstName = '',
    this.lastName = '',
    this.departament = '',
    this.oficeName = '',
    this.teamName = '',
    this.floorNumber = '',
    this.hasChanged = false,
    this.formStatus = const InitialFormStatus(),
  });

  ProfileState copyWith({
    bool? myProfile,
    String? profileImage,
    String? firstName,
    String? lastName,
    String? departament,
    String? oficeName,
    String? teamName,
    String? floorNumber,
    bool? hasChanged,
    FormSubmissionStatus? formStatus,
  }) {
    return ProfileState(
      myProfile: myProfile ?? this.myProfile,
      profileImage: profileImage ?? this.profileImage,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      departament: departament ?? this.departament,
      oficeName: oficeName ?? this.oficeName,
      teamName: teamName ?? this.teamName,
      floorNumber: floorNumber ?? this.floorNumber,
      hasChanged: hasChanged ?? this.hasChanged,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
