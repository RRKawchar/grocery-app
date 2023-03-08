import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/providers/product_provider.dart';
import 'package:grocery_app/screen/home/home_screen.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context)=>ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Grocery app',

        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

