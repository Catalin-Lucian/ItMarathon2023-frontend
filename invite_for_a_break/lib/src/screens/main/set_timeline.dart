import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/profile/profile_cubit.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../models/mettings.dart';

class SetTimeLineView extends StatefulWidget {
  const SetTimeLineView({Key? key}) : super(key: key);

  @override
  State<SetTimeLineView> createState() => _SetTimeLineViewState();
}

class _SetTimeLineViewState extends State<SetTimeLineView> {
  final _selectedDate = DateTime.now();
  var _startTime = TimeOfDay.now();
  var _endTime = TimeOfDay.now();

  void _selectStartTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (newTime != null) {
      setState(() {
        _startTime = newTime;
      });
    }
  }

  void _selectEndTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (newTime != null) {
      setState(() {
        _endTime = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileNavState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            // back button
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                context.read<ProfileCubit>().gotoMain();
              },
            ),
            title: Text("Set Timeline"),
          ),
          body: SfCalendar(
            view: CalendarView.day,
            dataSource: MeetingDataSource(_getDataSource()),

            // set start limit to 8 am
            minDate: DateTime(
                _selectedDate.year, _selectedDate.month, _selectedDate.day, 8),
            // set end limit to 8 pm
            maxDate: DateTime(
                _selectedDate.year, _selectedDate.month, _selectedDate.day, 16),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // open a dialog bloc with start time and end time
              _showMyDialog(context);
            },
            child: Icon(Icons.add),
          ));
    });
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Set free time'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Start Time'),
              onPressed: () {
                _selectStartTime();
              },
            ),
            ElevatedButton(
              child: const Text('End Time'),
              onPressed: () {
                _selectEndTime();
              },
            ),
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 8);
    final DateTime endTime = startTime.add(const Duration(hours: 8));
    meetings.add(Meeting('Conference', startTime, endTime, Colors.red, false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}
