import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letshare/screen/challenge.dart';
import 'package:letshare/screen/home.dart';
import 'package:letshare/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:letshare/screen/detail.dart';
import 'package:letshare/screen/signup.dart';
import 'package:letshare/screen/welcome.dart';
// import 'package:thebrioflashynavbar/thebrioflashynavbar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF24577A),
          secondary: const Color.fromARGB(255, 84, 156, 160),
          tertiary: const Color.fromARGB(255, 240, 241, 243),
        ),
        textTheme: TextTheme(
            caption: GoogleFonts.balooTamma(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: const Color(0xFF24577A)),
            headline2: GoogleFonts.balooTamma(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF24577A)),
            headline1: GoogleFonts.balooTamma(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF323B69)),
            headline4: GoogleFonts.balooTamma(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
            headline5: GoogleFonts.balooTamma(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 5, 5, 5),
            ),
            bodyText1: GoogleFonts.balooTamma(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF022B3A)),
            bodyText2: GoogleFonts.balooTamma(
              fontSize: 14,
              color: const Color(0xFF022B3A),
              fontWeight: FontWeight.w600,
            ),
            ),
            
      ),
      home: LoginPage(),);
  }
}


