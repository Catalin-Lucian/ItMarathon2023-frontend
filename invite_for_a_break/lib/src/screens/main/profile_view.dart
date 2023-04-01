import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/profile/profile_bloc.dart';
import 'package:invite_for_a_break/src/bloc/profile/profile_event.dart';
import 'package:invite_for_a_break/src/bloc/profile/profile_state.dart';
import 'package:invite_for_a_break/src/repository/profile_repo.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileBloc(
          profileRepo: context.read<ProfileRepo>(),
        )..add(ProfileLoading(userId: null)),
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              _profilePictureField(),
              _gap(),
              _firstNameField(),
              _gap(),
              _lastNameField(),
              _gap(),
              _departmentField(),
              _gap(),
              _officeNameField(),
              _gap(),
              _teamNameField(),
              _gap(),
              _floorNumberField(),
              _saveChangesButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilePictureField() {
    return // profile picture
        ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset(
        "assets/images/profile.jpg",
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _firstNameField() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: state.firstName,
            label: Text("First Name"),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => context.read<ProfileBloc>().add(
                ProfileFirstNameChanged(firstName: value),
              ),
        );
      },
    );
  }

  Widget _lastNameField() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: state.lastName,
            label: Text("Last Name"),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => context.read<ProfileBloc>().add(
                ProfileLastNameChanged(lastName: value),
              ),
        );
      },
    );
  }

  Widget _departmentField() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: state.departament,
            label: Text("Department Name"),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => context.read<ProfileBloc>().add(
                ProfileDepartamentChanged(departament: value),
              ),
        );
      },
    );
  }

  Widget _officeNameField() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: state.oficeName,
            label: Text("Office Name"),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => context.read<ProfileBloc>().add(
                ProfileLastNameChanged(lastName: value),
              ),
        );
      },
    );
  }

  Widget _teamNameField() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: state.teamName,
            label: Text("Team Name"),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => context
              .read<ProfileBloc>()
              .add(ProfileTeamNameChanged(teamName: value)),
        );
      },
    );
  }

  Widget _floorNumberField() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: state.floorNumber,
            label: Text("Floor Number"),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => context.read<ProfileBloc>().add(
                ProfileFloorNumberChanged(floorNumber: value),
              ),
        );
      },
    );
  }

  Widget _saveChangesButton() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<ProfileBloc>().add(
                  ProfileSubmited(),
                );
          },
          child: Text("Save Changes"),
        );
      },
    );
  }

  Widget _gap() {
    return SizedBox(
      height: 10,
    );
  }
}
