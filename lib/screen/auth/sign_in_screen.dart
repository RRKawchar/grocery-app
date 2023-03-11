import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_app/providers/user_porvider.dart';
import 'package:grocery_app/screen/home/home_screen.dart';
import 'package:grocery_app/widget/textWidget.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserProvider userProvider;

  Future<User?> _googleSignIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      final FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuth =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuth.accessToken,
          idToken: googleSignInAuth.idToken);

      final User? user = (await auth.signInWithCredential(credential)).user;
      userProvider.addUserData(
          currentUser: user!,
          userName: user.displayName.toString(),
          userEmail: user.email.toString(),
          userImage: user.photoURL.toString(),
          phoneNumber: user.phoneNumber.toString());

      return user;
    } catch (e) {
      print(e.toString());
      throw Exception('Google Sign In failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(text: 'Sign in to continue'),
                  TextWidget(
                    text: 'Grocery',
                    size: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadow: [
                      BoxShadow(
                          blurRadius: 8,
                          color: Colors.green.shade900,
                          blurStyle: BlurStyle.outer,
                          offset: const Offset(2, 2))
                    ],
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Apple,
                        text: "Sign up with Apple",
                        onPressed: () {},
                      ),
                      SignInButton(Buttons.Google, text: "Sign up with Google",
                          onPressed: () async {
                        await _googleSignIn().then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          ),
                        );
                      }),
                    ],
                  ),
                  Column(
                    children: [
                      TextWidget(
                        text: "By signing in you are agreeing to our",
                        color: Colors.grey[800],
                      ),
                      TextWidget(
                        text: "terms and privacy policy",
                        color: Colors.grey[800],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
