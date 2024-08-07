import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  signInWithGoogle() async {
    
    /*final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);*/
        // Clear Google Sign-In cache
    await _googleSignIn.signOut();

    final GoogleSignInAccount? gUser = await _googleSignIn.signIn();
    if (gUser == null) {
      // User canceled the sign-in flow
      return null;
    }

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
