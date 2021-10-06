import 'package:flutter/material.dart';
import 'package:invony/api_call/api_data.dart';
import 'package:invony/screens/home_page.dart';
import 'package:invony/screens/splash_screen.dart';
import 'package:invony/screens/user_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiCall(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserPage(),
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          HomePage.routeName: (context) => HomePage()
        },
      ),
    );
  }
}
