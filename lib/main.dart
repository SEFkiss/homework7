import 'package:flutter/material.dart';
import 'package:home_work_7/router.dart';
import 'package:home_work_7/screens/not_found_screen.dart';

void main() {
  FluroRouter.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: FluroRouter.router.generator,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return NotFoundScreen();
        });
      },
    );
  }
}
