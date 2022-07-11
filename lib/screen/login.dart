import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letshare/screen/signup.dart';
import 'package:letshare/screen/welcome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.balooTamma(
            textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Color.fromARGB(255, 201, 201, 201),
          ),
          contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 8),
          hintText: "Email",
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.4), width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 1.0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        style: GoogleFonts.balooTamma(
            textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Color.fromARGB(255, 201, 201, 201),
          ),
          contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 8),
          hintText: "Password",
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.4), width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 1.0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 69, 180, 254),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(emailController.text, passwordController.text);
        },
        child: Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: GoogleFonts.balooTamma(
              textStyle: TextStyle(
            fontSize: 14,
            color: Colors.white,
          )),
        ),
      ),
    );

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            width: w,
            height: h * 0.1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "img/top.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Container(
              child: Text('Let\'s share',
                  style: GoogleFonts.balooTamma(
                      textStyle: TextStyle(
                          fontSize: 55,
                          color: Color.fromARGB(255, 69, 180, 254)))),
            ),
          ),
          Container(margin: const EdgeInsets.all(20), child: Column()),
          Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
              width: w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.balooTamma(
                          textStyle: TextStyle(
                              fontSize: 33,
                              color: Color.fromARGB(255, 42, 48, 106))),
                    ),
                    Text(
                      "Please sign in to continue",
                      style: GoogleFonts.balooTamma(
                          textStyle: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 201, 201, 201))),
                    ),
                  ])),
          Center(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        emailField,
                        SizedBox(height: 25),
                        passwordField,
                        SizedBox(height: 35),
                        loginButton,
                        SizedBox(height: w * 0.3),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Don't have an account? ",
                                style: GoogleFonts.balooTamma(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(
                                            255, 201, 201, 201))),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                },
                                child: Text(
                                  "SignUp",
                                  style: GoogleFonts.balooTamma(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 69, 180, 254)),
                                  ),
                                ),
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: w * 0.198,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "img/bottom.png",
                    ),
                    fit: BoxFit.cover)),
          ),
        ]));
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Welcome())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
