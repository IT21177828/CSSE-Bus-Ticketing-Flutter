import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticketing_app/screens/qr_screen.dart';
import 'package:bus_ticketing_app/screens/qr_reader_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Bus Ticketing System',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: const Scaffold(
  //       backgroundColor: Colors.white,
  //       body: const QRScreen(),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.black54, primarySwatch: Colors.brown),
      home: const LoginScreen(),
    );
  }
}
