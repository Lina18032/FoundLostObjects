import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:objects_found_lost/homePage.dart';
import 'package:objects_found_lost/services/auth_service.dart';
import 'package:objects_found_lost/signUp.dart';
import 'package:objects_found_lost/profile.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false; // Track loading state

  void signUserIn(BuildContext context) async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Navigate to HomePage upon successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showErrorMessage("Incorrect email", "The email address you entered is not found.");
      } else if (e.code == 'wrong-password') {
        showErrorMessage("Incorrect password", "The password you entered is not correct.");
      } else {
        showErrorMessage("Error", "An unexpected error occurred. Please try again.");
      }
    } finally {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
    }
  }

  void signInWithGoogle(BuildContext context) async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      UserCredential? userCredential = await AuthService().signInWithGoogle();
      if (userCredential != null) {
        // Navigate to HomePage upon successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } finally {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
    }
  }

  void showErrorMessage(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF0B6EFE)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Logo',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 30.0),
            Image.asset(
              'images/login.png',
              width: 310,
              height: 180,
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                "Welcome Back.You've been missed!",
                style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 50,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add Forgot Password logic here
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF635C5C),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: isLoading ? null : () {
                    signUserIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF186EE6),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: isLoading ? CircularProgressIndicator() : Text('Login'),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Or Sign up With'),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  signInWithGoogle(context);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF635C5C)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/Googlelogo.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Your estin email',
                      style: TextStyle(
                        color: Color(0xFF635C5C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?'),
                const SizedBox(width: 8.0,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
