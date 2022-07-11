import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letshare/model/user_model.dart';
import 'package:letshare/screen/welcome.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final usernameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final usernameField = TextFormField(
        autofocus: false,
        controller: usernameEditingController,
        keyboardType: TextInputType.name,
        style: GoogleFonts.balooTamma(
            textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          usernameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.person, color: Color.fromARGB(255, 201, 201, 201)),
          contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 8),
          hintText: "Username",
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

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
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
          usernameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.mail, color: Color.fromARGB(255, 201, 201, 201)),
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
        controller: passwordEditingController,
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
          usernameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.lock, color: Color.fromARGB(255, 201, 201, 201)),
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

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        style: GoogleFonts.balooTamma(
            textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.lock, color: Color.fromARGB(255, 201, 201, 201)),
          contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 8),
          hintText: "Confirm Password",
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

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 69, 180, 254),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: GoogleFonts.balooTamma(
                textStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            )),
          )),
    );

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back, color: Colors.grey),
        //     onPressed: () {
        //       // passing this to our root
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ),
        body: Column(
          children: [
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 300),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.grey),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
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
          Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Account",
                  style: GoogleFonts.balooTamma(
                      textStyle: TextStyle(
                          fontSize: 33,
                          color: Color.fromARGB(255, 42, 48, 106))),
                ),
              ]
            )
          ),
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
                    usernameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: w * 0.05),
                    Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "already have a account? ",
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
                                  "SignIn",
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
            height: w * 0.168,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "img/bottom.png",
                    ),
                    fit: BoxFit.cover)),
          ),
        ]));
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Welcome()), (route) => false);
  }
}
