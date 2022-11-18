import 'package:flutter/material.dart';


class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: FloatingActionButton(
              onPressed: () {
                !loggedIn
                    ? Navigator.of(context).pushNamed('/login')
                    : signOut();
              },
              heroTag: 'login/out',
              child: !loggedIn ? const Text('Login') : const Text('Logout')),
        ),
        Visibility(
            visible: loggedIn,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                  heroTag: 'profile',
                  child: const Text('Profile')),

            ))
      ],
    );
  }
}