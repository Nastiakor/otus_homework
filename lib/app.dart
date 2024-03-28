import 'package:flutter/material.dart';
import 'package:flutter_homework/presentation/routes/routes.dart';
import 'package:flutter_homework/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      theme: AppTheme.theme,
    );
  }
}
