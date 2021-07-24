import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final res = await _googleSignIn.signIn();
      authController.setUser(context, res);
      print(res);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
