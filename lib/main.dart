import 'package:final_project_start/homepage.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'auth_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/homePage': (context) => const MyHomePage(),
        '/aboutScreen': (context) => const AboutScreen(),
      //  '/infoScreen': (context) => const InfoScreen(),
          // final argument = ModalRoute.of(context)?.settings.arguments;
          // if(argument is int) {
          //   return InfoScreen(userId: argument,);
          // }
          // else {return InfoScreen(userId: 0,);}
          // },
      },
    );
  }
}

