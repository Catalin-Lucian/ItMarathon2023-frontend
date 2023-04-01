import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image.asset(
        //   "assets/images/logo.png",
        //   height: isSmallScreen ? 100 : 200,
        // ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Welcome to Invite for a Break",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}
