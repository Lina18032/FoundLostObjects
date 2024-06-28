import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<UserCredential?> signInWithGoogle() async {
    print('Attempting to sign in with Google...');

    // Force sign-out to prompt the user to select an account
    await GoogleSignIn().signOut();

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) {
      print('User did not select an account.');
      return null;
    }

    final GoogleSignInAuthentication? gAuth = await gUser.authentication;

    if (gAuth == null || gAuth.accessToken == null || gAuth.idToken == null) {
      print('Authentication data is missing.');
      return null;
    }

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    try {
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print('Successfully signed in with Google: ${userCredential.user?.displayName}');
      return userCredential;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }
}
