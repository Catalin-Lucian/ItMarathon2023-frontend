import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/auth/auth_cubit.dart';
import 'package:invite_for_a_break/src/bloc/auth/auth_navigator.dart';
import 'package:invite_for_a_break/src/bloc/session/session_cubit.dart';
import 'package:invite_for_a_break/src/bloc/session/session_state.dart';
import 'package:invite_for_a_break/src/screens/session/loading_view.dart';
import 'package:invite_for_a_break/src/screens/session/session_view.dart';

class SessionNavigator extends StatelessWidget {
  const SessionNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is UnknowSessionState) MaterialPage(child: LoadingView()),
          if (state is UnauthenticatedSessionState)
            MaterialPage(
                child: BlocProvider(
                    create: (context) =>
                        AuthCubit(sessionCubit: context.read<SessionCubit>()),
                    child: AuthNavigator())),
          if (state is AuthenticatedSessionState)
            MaterialPage(child: SessionView()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
