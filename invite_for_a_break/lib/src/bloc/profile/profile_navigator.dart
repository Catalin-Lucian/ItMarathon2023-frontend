import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/profile/profile_cubit.dart';
import 'package:invite_for_a_break/src/screens/main/profile_view.dart';
import 'package:invite_for_a_break/src/screens/main/set_timeline.dart';
import 'package:invite_for_a_break/src/screens/main/view_timeline.dart';

class ProfileNavigator extends StatelessWidget {
  const ProfileNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileNavState>(
        builder: (context, state) {
      return Navigator(
        pages: [
          // profile view
          if (state == ProfileNavState.main)
            MaterialPage(
              child: ProfileView(),
            ),

          // set free time
          if (state == ProfileNavState.setFreeTime)
            MaterialPage(
              child: SetTimeLineView(),
            ),

          // view free time
          if (state == ProfileNavState.viewFreeTime)
            MaterialPage(
              child: ViewimeLineView(),
            )
        ],
      );
    });
  }
}
