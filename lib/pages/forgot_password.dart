import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments
    as Map<String, dynamic>?;

    return ForgotPasswordScreen(
      email: arguments?['email'] as String,
      headerMaxExtent: 200,
    );
  }

}