import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/sendrequest/sendrequest_bloc.dart';
import 'package:invite_for_a_break/src/bloc/sendrequest/sendrequest_state.dart';
import 'package:invite_for_a_break/src/repository/sendrequest.dart';

class SendRequestView extends StatelessWidget {
  const SendRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendBloc(
        sendRepo: context.read<SendRequestRepo>(),
      ),
      child: Scaffold(
        body: _form(),
        floatingActionButton: _saveChangesButton(),
      ),
    );
  }

  Widget _form() {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _dateView(),
          SizedBox(height: 20),
          _timeIntervalStartField(),
          SizedBox(height: 20),
          _timeIntervalEndField(),
          SizedBox(height: 20),
          _placeField(),
          SizedBox(height: 20),
          _commentField(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _dateView() {
    return TextFormField(
        decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: Text("Date"),
      border: OutlineInputBorder(),
    ));
  }

  Widget _timeIntervalStartField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Time interval start",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _timeIntervalEndField() {
    return TextField(
        decoration: InputDecoration(
      labelText: "Time interval end",
      border: OutlineInputBorder(),
    ));
  }

  Widget _placeField() {
    return TextField(
        decoration: InputDecoration(
      labelText: "Place",
      border: OutlineInputBorder(),
    ));
  }

  Widget _commentField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Comment",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _saveChangesButton() {
    return FloatingActionButton.extended(
      onPressed: () {},
      backgroundColor: Colors.green,
      label: Text("Save Changes"),
    );
  }
}
