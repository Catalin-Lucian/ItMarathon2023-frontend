import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/profile/profile_cubit.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SetTimeLineView extends StatelessWidget {
  const SetTimeLineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileNavState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            // back button
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            title: Text("Set Timeline"),
          ),
          body: SfCalendar(
            view: CalendarView.day,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // open a dialog bloc with start time and end time
            },
            child: Icon(Icons.add),
          ));
    });
  }
}
