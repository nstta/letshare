import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letshare/model/challenge_model.dart';
import 'package:letshare/screen/home.dart';

class Challenges extends StatefulWidget {
  const Challenges({Key? key}) : super(key: key);

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  final _formKey = GlobalKey<FormState>();

  final nameEditingController = new TextEditingController();
  final photoEditingController = new TextEditingController();
  final targetEditingController = new TextEditingController();
  final end_dateEditingController = new TextEditingController();
  final provinceEditingController = new TextEditingController();
  final descriptionEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    final nameField = TextFormField(
        autofocus: false,
        controller: nameEditingController,
        keyboardType: TextInputType.name,
        style: GoogleFonts.balooTamma(
            textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
        onSaved: (value) {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 15, 0, 8),
          hintText: "Name Challenge",
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

    final photoField = TextFormField(
        autofocus: false,
        controller: photoEditingController,
        keyboardType: TextInputType.name,
        style: GoogleFonts.balooTamma(
            textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
        onSaved: (value) {
          photoEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 15, 0, 8),
          hintText: "Photo",
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

    final targetField = TextFormField(
        autofocus: false,
        controller: targetEditingController,
        keyboardType: TextInputType.name,
        style: GoogleFonts.balooTamma(
            textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
        onSaved: (value) {
          targetEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 15, 0, 8),
          hintText: "Target",
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

    final end_dateField = TextFormField(
        autofocus: false,
        controller: end_dateEditingController,
        keyboardType: TextInputType.name,
        style: GoogleFonts.balooTamma(
            textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
        onSaved: (value) {
          end_dateEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 15, 0, 8),
          hintText: "End Date",
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

    final provinceField = TextFormField(
        autofocus: false,
        controller: provinceEditingController,
        keyboardType: TextInputType.name,
        style: GoogleFonts.balooTamma(
            textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
        onSaved: (value) {
          provinceEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 15, 0, 8),
          hintText: "Province",
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

    final descriptionField = TextFormField(
      autofocus: false,
      controller: descriptionEditingController,
      keyboardType: TextInputType.name,
      style: GoogleFonts.balooTamma(
          textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
      onSaved: (value) {
        descriptionEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(30, 15, 0, 8),
        hintText: "Description",
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
      ),
      maxLines: 4,
    );

    final pulishButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 69, 180, 254),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            postDetailsToFirestore();
            //   createChallenge(
            //       nameEditingController.text,
            //       photoEditingController.text,
            //       targetEditingController.text,
            //       end_dateEditingController.text,
            //       provinceEditingController.text,
            //       descriptionEditingController.text);
            // },
          },
          child: Text(
            "Publish",
            textAlign: TextAlign.center,
            style: GoogleFonts.balooTamma(
                textStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            )),
          )),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: BoxDecoration(color: Color.fromARGB(255, 69, 180, 254)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 30, top: 30),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 15),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homescreen()));
                            },
                          ),
                        ),
                        Text(
                          'Create challenges',
                          style: GoogleFonts.balooTamma(
                              textStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          )),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          SingleChildScrollView(
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
                      nameField,
                      SizedBox(height: 20),
                      photoField,
                      SizedBox(height: 20),
                      targetField,
                      SizedBox(height: 20),
                      end_dateField,
                      SizedBox(height: 20),
                      provinceField,
                      SizedBox(height: 20),
                      descriptionField,
                      SizedBox(height: 20),
                      pulishButton,
                      SizedBox(height: w * 0.05),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]));
  }

  // void createChallenge(String name, String photo, String target,
  //     String end_date, String province, String description) async {
  //       if (_formKey.currentState!.validate()) {
  //       try {
  //       await _auth
  //           .createUserWithEmailAndPassword(email: email, password: password)
  //           .then((value) => {postDetailsToFirestore()})
  //           .catchError((e) {
  //         Fluttertoast.showToast(msg: e!.message);
  //       });
  //     }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    ChallengeModel challengeModel = ChallengeModel();

    // writing all the values
    challengeModel.name = nameEditingController.text;
    challengeModel.photo = photoEditingController.text;
    challengeModel.target = targetEditingController.text;
    challengeModel.end_date = end_dateEditingController.text;
    challengeModel.province = provinceEditingController.text;
    challengeModel.description = descriptionEditingController.text;

    await firebaseFirestore
        .collection("challenge")
        .doc()
        .set(challengeModel.toMap());
    Fluttertoast.showToast(msg: "Account created challenge:) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => Homescreen()),
        (route) => false);
  }
}
