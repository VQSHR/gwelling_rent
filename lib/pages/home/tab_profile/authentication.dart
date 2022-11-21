import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed, super.key});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white)),
        onPressed: onPressed,
        child: child,
      );
}

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
          child: StyledButton(
              onPressed: () {
                !loggedIn
                    ? Navigator.of(context).pushNamed('/login')
                    : signOut();
              },
              child: !loggedIn
                  ? const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
          ),
        ),
        Visibility(
            visible: loggedIn,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              child: StyledButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                  child: const Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            )
        )
      ],
    );
  }
}
