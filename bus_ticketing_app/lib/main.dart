import 'package:bus_ticketing_app/responsive/responsive.dart';
import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:bus_ticketing_app/screens/user/user_wallet.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticketing_app/screens/qr_screen.dart';
import 'package:bus_ticketing_app/screens/qr_reader_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:bus_ticketing_app/widgets/qr_image.dart'

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.black54, primarySwatch: Colors.brown),
      home: LoginScreen(),
    );
  }
}
