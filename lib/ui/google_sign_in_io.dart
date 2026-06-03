import 'package:google_sign_in/google_sign_in.dart';

Future<void> clearGoogleSignIn() async {
  final googleSignIn = GoogleSignIn();
  await googleSignIn.disconnect();
  await googleSignIn.signOut();
}