import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:objects_found_lost/homePage.dart';
import 'package:objects_found_lost/login.dart';
import 'package:objects_found_lost/services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false; // Track loading state

  void signUserUp(BuildContext context) async {
    if (passwordController.text != confirmPasswordController.text) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Password mismatch"),
            content: Text("The passwords you entered do not match."),
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
      return;
    }

    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Navigate to HomePage upon successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred.';

      if (e.code == 'email-already-in-use') {
        message = 'The email address is already in use by another account.';
      } else if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      }

      // Show error message to user
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ));
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
              'images/login.png', // Update the image asset for sign up
              width: 310,
              height: 180,
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                "Welcome abroad !Join Us",
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
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20.0),

            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    signUserUp(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF186EE6),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text('Sign Up'),
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
            SizedBox(height: 10.0,),
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
                Text('Already Registered?'),
                const SizedBox(width: 8.0,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Login now',
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
