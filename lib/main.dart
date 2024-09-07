import 'package:character_cubit_api/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp(
    appRouter: AppRoute(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.appRouter});

  final AppRoute appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
