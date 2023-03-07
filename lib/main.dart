import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/auth/sign_in_screen.dart';
import 'package:grocery_app/screen/home/home_screen.dart';
import 'package:grocery_app/utility/constants.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery app',

      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home:const HomeScreen(),
    );
  }
}

