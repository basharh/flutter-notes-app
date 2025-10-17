import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/theme_data.dart';
import 'package:flutter_test/flutter_test.dart';

extension SetScreenSize on WidgetTester {
  Future<void> setScreenSize({
    double width = 540,
    double height = 960,
    double pixelDensity = 1,
  }) async {
    final size = Size(width, height);
    await binding.setSurfaceSize(size);
  }
}

class TestMaterialApp extends StatelessWidget {
  final Widget child;
  final bool page;

  const TestMaterialApp({super.key, required this.child, this.page = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeData(Brightness.light),
      home: page ? child : Scaffold(body: Center(child: child)),
    );
  }
}
