part of 'services.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  //Sign in with google account
  static Future<UserCredential> signInWithGoogle() async {
    Firebase.initializeApp();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await auth.signInWithCredential(credential);
  }

  // Get firebase UID current user
  static Future<String> getUid() async {
    Firebase.initializeApp();
    return auth.currentUser!.uid;
  }

  // Get firebase Current user
  static Future<User?> getCurrentUser() async {
    Firebase.initializeApp();
    return auth.currentUser;
  }

  //Sign out from application
  static Future signOut() async {
    Firebase.initializeApp();
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    return true;
  }
}
