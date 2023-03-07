import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:testing_flutter/screens/home_screen/home_screen.dart';
import 'package:testing_flutter/providers/user_provider.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn>{
  late UserProvider userProvider;
  _googleSignUp() async {
   // FirebaseApp firebaseApp = await Firebase.initializeApp();
    //return firebaseApp;
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );

      final User user = (await _auth.signInWithCredential(credential)) as User;
      //print("signed in " + user.displayName);
       userProvider.addUserdata(
        currentUser: user,
        userEmail: user.email,
        userImage: user.photoURL,
        userName: user.displayName,
      );

      //return user;
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context){
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
           //image: DecorationImage(
             //fit: BoxFit.cover,
             //image: AssetImage("assets/background.jpg")
           ),
         //),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              //color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sign in to continue',
                  style: TextStyle(fontSize: 20,
                    fontFamily: 'Domine',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,),),
                  Text('FixIt',
                    style: TextStyle(
                    fontSize: 80,
                      fontFamily: 'Rowdies',
                      fontWeight: FontWeight.w700,
                      color: Colors.amber,
                        shadows: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black26,
                          offset: Offset(3,3),
                    )
                        ] ),),
                  Column(
                    children: [
                  SignInButton(
                    Buttons.Google,
                    text: "Sign in with Google",
                    onPressed: () {_googleSignUp().then((value) => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context)=> HomeScreen(),
                      ),
                    ),
                    );
                      },
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    text: "Sign in with Facebook",
                    onPressed: () {},
                  ),
                      SignInButton(
                        Buttons.AppleDark,
                        text: "Sign in with Apple",
                        onPressed: () {},
                      ),
              ],
                  ),
                  Column(
                    children: [
                  Text('By signing in you are agreeing to our',
                    style: TextStyle(fontSize: 10,
                      fontFamily: 'Domine',
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,),),
                      Text('Terms and Privacy Policy',
                        style: TextStyle(fontSize: 10,
                          fontFamily: 'Domine',
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,),),
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