import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:invite_for_a_break/src/bloc/main/main_cubit.dart';
import 'package:invite_for_a_break/src/bloc/main/main_navigator.dart';
import 'package:invite_for_a_break/src/bloc/main/main_state.dart';

import '../../../constants.dart';

class SessionView extends StatelessWidget {
  const SessionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: Scaffold(
          body: MainNavigator(),
          bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(3)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20),
                  child: GNav(
                    backgroundColor: kPrimaryColor,
                    tabBackgroundColor: Colors.white.withOpacity(0.1),
                    color: Colors.white,
                    activeColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    onTabChange: (index) => _onTap(index, context),
                    gap: 8,
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: "Home",
                      ),
                      GButton(
                        icon: Icons.send,
                        text: "Send Request",
                      ),
                      GButton(
                        icon: Icons.assessment,
                        text: "View Requests",
                      ),
                      GButton(
                        icon: Icons.person,
                        text: "Profile",
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }

  void _onTap(int index, BuildContext context) {
    context.read<MainCubit>().showByIndex(index);
  }
}
