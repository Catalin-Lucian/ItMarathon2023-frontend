import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/constants.dart';
import 'package:invite_for_a_break/src/bloc/session/session_cubit.dart';
import 'package:invite_for_a_break/src/bloc/session/session_navigator.dart';

import 'src/repository/auth_repo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Invite for a break';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: kPrimaryColor,
      )),
      home: Scaffold(
          body: SafeArea(
        child: RepositoryProvider(
          create: (context) => AuthRepo(),
          child: BlocProvider(
              create: (context) =>
                  SessionCubit(authRepo: context.read<AuthRepo>()),
              child: SessionNavigator()),
        ),
      )),
    );
  }
}
