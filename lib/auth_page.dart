import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:objects_found_lost/firstPage.dart';
import 'package:objects_found_lost/login.dart';
import 'package:objects_found_lost/homePage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //user is logged in
          if(snapshot.hasData){
            return HomePage();
          }
          //user is not logged in
          else{
            return LoginPage();
          }
        }
      ),
    );
  }
}
