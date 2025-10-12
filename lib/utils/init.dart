import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitInfo {
  final User? user = FirebaseAuth.instance.currentUser;
}

final initInfoFutureProvider = FutureProvider<InitInfo>((ref) async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
  }

  return InitInfo();
});

final initInfoProvider = Provider<InitInfo>((ref) {
  throw UnimplementedError();
});
