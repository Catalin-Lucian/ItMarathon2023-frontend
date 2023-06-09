import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/auth/auth_cubit.dart';
import 'package:invite_for_a_break/src/bloc/auth/register/register_bloc.dart';
import 'package:invite_for_a_break/src/bloc/auth/register/register_event.dart';
import 'package:invite_for_a_break/src/bloc/auth/register/register_state.dart';
import 'package:invite_for_a_break/src/bloc/form_submision_status.dart';
import 'package:invite_for_a_break/src/repository/auth_repo.dart';
import 'package:invite_for_a_break/src/widgets/auth_logo_widget.dart';

class RegisterView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) =>
                RegisterBloc(authRepo: context.read<AuthRepo>()),
            child: _registerForm(context)));
  }

  Widget _registerForm(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is SubmissionFailedStatus) {
            _showSnackBar(context, formStatus.errorMesssage, Colors.red);
          } else if (formStatus is SubmissionSuccessStatus) {
            _showSnackBar(
                context, "Register success! Please log in.", Colors.green);
          }
        },
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: isSmallScreen
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [AuthLogo(), _gap(), _formContent(context)],
                    )
                  : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Expanded(child: AuthLogo()),
                      _gap(),
                      Expanded(child: _formContent(context))
                    ]),
            ),
          ),
        ));
  }

  Widget _formContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _emailField(),
        _gap(),
        _passwordField(),
        _gap(),
        _confirmPasswordField(),
        _gap(),
        _registerButton(),
        _gap(),
        _goToLogin(context),
      ],
    );
  }

  Widget _emailField() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
          label: Text('Email'),
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(),
        ),
        validator: (value) => state.isValidEmail ? null : 'Invalid email',
        onChanged: (value) => context.read<RegisterBloc>().add(
              RegisterEmailChanged(email: value),
            ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
          label: Text("Password"),
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            icon: Icon(state.isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off),
            onPressed: () => context.read<RegisterBloc>().add(
                  RegisterPasswordVisibilityChanged(
                      isPasswordVisible: !state.isPasswordVisible),
                ),
          ),
          border: OutlineInputBorder(),
        ),
        obscureText: !state.isPasswordVisible,
        validator: (value) => state.isValidPassword ? null : 'Invalid password',
        onChanged: (value) => context.read<RegisterBloc>().add(
              RegisterPasswordChanged(password: value),
            ),
      );
    });
  }

  Widget _confirmPasswordField() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
          label: Text("Confirm Password"),
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            icon: Icon(state.isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off),
            onPressed: () => context.read<RegisterBloc>().add(
                  RegisterPasswordVisibilityChanged(
                      isPasswordVisible: !state.isPasswordVisible),
                ),
          ),
          border: OutlineInputBorder(),
        ),
        obscureText: !state.isPasswordVisible,
        validator: (value) =>
            state.isPasswordMatching ? null : 'Password not matching',
        onChanged: (value) => context.read<RegisterBloc>().add(
              RegisterPasswordVerificationChanged(password: value),
            ),
      );
    });
  }

  Widget _registerButton() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return state.formStatus is FormSubmittingStatus
          ? const CircularProgressIndicator()
          : SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<RegisterBloc>().add(RegisterSubmitted());
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ));
    });
  }

  Widget _goToLogin(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextButton(
            onPressed: () => context.read<AuthCubit>().showLogin(),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    });
  }

  void _showSnackBar(BuildContext context, String message, Color? color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color ?? ThemeData().snackBarTheme.backgroundColor,
    ));
  }

  Widget _gap() => const SizedBox(height: 16);
}
