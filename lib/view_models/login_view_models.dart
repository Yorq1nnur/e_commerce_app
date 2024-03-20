import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screen/user_screen/user_screen.dart';

class LoginViewModel extends ChangeNotifier {
  String email = "";
  String password = "";

  updateEmail(String v) {
    email = v;
  }

  updatePassword(String v) {
    password = v;
  }

  login(BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.uid.isNotEmpty) {
        debugPrint("UID:${credential.user!.uid}");
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const UserScreen();
              },
            ),
          );
        }
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(
        e.toString(),
      );
    }
  }
}
