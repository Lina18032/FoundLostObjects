import 'package:flutter/material.dart';
import 'package:objects_found_lost/firstPage.dart';
import 'package:objects_found_lost/homePage.dart';
import 'package:objects_found_lost/login.dart';
import 'package:objects_found_lost/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'profile.dart';
import 'message.dart';
import 'package:objects_found_lost/fullDescription.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Firstpage(),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/profile': (context) => ProfilePage(),
        '/message':(context) => MessagePage(),
        '/fullDescription': (context) => FullDescriptionPage(),

      },
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
