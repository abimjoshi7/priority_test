import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';

class MyApp extends StatelessWidget with AppRouter {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      theme: AppTheme.themeData,
      onGenerateRoute: (settings) => onGenerate(settings),
    );
  }
}
