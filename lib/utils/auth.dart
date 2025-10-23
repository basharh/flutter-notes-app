import 'package:firebase_auth/firebase_auth.dart';

/// Converts authentication error codes to user-friendly messages.
String getErrorMessageForAuthException(exception) {
  if (exception is! FirebaseAuthException) {
    return 'An unknown error occurred.';
  }

  return switch (exception.code) {
    'invalid-email' => 'The email address is badly formatted.',
    'user-disabled' => 'The user account has been disabled.',
    'user-not-found' => 'No user found for the given email address.',
    'wrong-password' => 'Incorrect password provided for the user.',
    'email-already-in-use' =>
      'The email address is already in use by another account.',
    'operation-not-allowed' => 'Email/password accounts are not enabled.',
    'weak-password' => 'The password is too weak.',
    'invalid-credential' => 'The credential are invalid or expired.',
    _ => 'An undefined error occurred.',
  };
}
