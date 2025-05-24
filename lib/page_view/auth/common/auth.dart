import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(
      {required String email, required String password}) async {
    String result = "Some Error Occured";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        result = "Success";
      } else {
        result = "Please fill all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return result;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String result = "Some Error Occured";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential credential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "Success";
      } else {
        result = "Please fill all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return result;
  }

  Future<bool> google() async {
    final user = await GoogleSignIn().signIn();
    GoogleSignInAuthentication userAuth = await user!.authentication;
    var credential = GoogleAuthProvider.credential(
        idToken: userAuth.idToken, accessToken: userAuth.accessToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
    return FirebaseAuth.instance.currentUser != null;
  }

 
    Future<void> signOut()async{
      await FirebaseAuth.instance.signOut();

    }
  }

