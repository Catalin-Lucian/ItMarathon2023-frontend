import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/main/main_cubit.dart';
import 'package:invite_for_a_break/src/bloc/main/main_state.dart';
import 'package:invite_for_a_break/src/bloc/profile/profile_cubit.dart';
import 'package:invite_for_a_break/src/bloc/profile/profile_navigator.dart';
import 'package:invite_for_a_break/src/bloc/session/session_cubit.dart';
import 'package:invite_for_a_break/src/repository/homepage_repo.dart';
import 'package:invite_for_a_break/src/repository/profile_repo.dart';
import 'package:invite_for_a_break/src/screens/main/home_view.dart';
import 'package:invite_for_a_break/src/screens/main/send_request_view.dart';
import 'package:invite_for_a_break/src/screens/main/view_requests_view.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(builder: (context, state) {
      return Navigator(
        pages: [
          // Home page
          if (state is HomeState)
            MaterialPage(
              child: RepositoryProvider(
                create: (context) => HomepageRepo(),
                child: HomeView(),
              ),
            ),

          // Send request page
          if (state is SendRequestState) MaterialPage(child: SendRequestView()),

          // View requests page
          if (state is ViewRequestState)
            MaterialPage(child: ViewRequestsView()),

          // Profile page
          if (state is ViewProfileState)
            MaterialPage(
              child: RepositoryProvider(
                create: (context) =>
                    ProfileRepo(sessionCubit: context.read<SessionCubit>()),
                child: BlocProvider(
                    create: (context) => ProfileCubit(),
                    child: ProfileNavigator()),
              ),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
