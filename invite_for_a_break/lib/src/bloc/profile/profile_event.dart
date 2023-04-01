import 'dart:io';

abstract class ProfileEvent {}

class ProfileLoading extends ProfileEvent {
  final int? userId;

  ProfileLoading({required this.userId});
}

class ProfileImageChanged extends ProfileEvent {
  final File image;

  ProfileImageChanged({required this.image});
}

class ProfileFirstNameChanged extends ProfileEvent {
  final String firstName;

  ProfileFirstNameChanged({required this.firstName});
}

class ProfileLastNameChanged extends ProfileEvent {
  final String lastName;

  ProfileLastNameChanged({required this.lastName});
}

class ProfileDepartamentChanged extends ProfileEvent {
  final String departament;

  ProfileDepartamentChanged({required this.departament});
}

class ProfileOficeNameChanged extends ProfileEvent {
  final String oficeName;

  ProfileOficeNameChanged({required this.oficeName});
}

class ProfileTeamNameChanged extends ProfileEvent {
  final String teamName;

  ProfileTeamNameChanged({required this.teamName});
}

class ProfileFloorNumberChanged extends ProfileEvent {
  final String floorNumber;

  ProfileFloorNumberChanged({required this.floorNumber});
}

class ProfileSubmited extends ProfileEvent {}

class ProfileSubmitfailed extends ProfileEvent {}
