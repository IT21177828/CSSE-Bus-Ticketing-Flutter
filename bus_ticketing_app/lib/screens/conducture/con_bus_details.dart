import 'dart:convert';

import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:bus_ticketing_app/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class BusDetails extends StatefulWidget {
  final String user_ID_Conduct;

  final UserType newUser;

  // final String user_Id;
  const BusDetails({required this.user_ID_Conduct, required this.newUser});

  @override
  // ignore: no_logic_in_create_state
  _BusDetailsState createState() => _BusDetailsState(user_ID_Conduct, newUser);
}

class _BusDetailsState extends State<BusDetails> {
  final String user_ID_Conduct;
  UserType NewUser;
  int capacity = 0;

  void getBusDetails() async {
    logger.e(user_ID_Conduct);

    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Adjust the content type as needed
    };

    // Make an HTTP POST request to the login API
    final response = await http.post(
      Uri.parse('http://192.168.8.101:5050/bus/getDetailsConId'),
      headers: headers,
      body: jsonEncode({
        'conductId': user_ID_Conduct,
      }),
    );
    // logger.e(response.body);

    final newjsonResponse = json.decode(response.body);
    // logger.e(newjsonResponse);

    capacity = newjsonResponse['capacity'];

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getBusDetails();
  }

  _BusDetailsState(this.user_ID_Conduct, this.NewUser);
  int remainingPassengers = 30; // Replace with actual data
  double currentAmount = 150.0; // Replace with actual data

  @override
  Widget build(BuildContext context) {
    String QRCode = user_ID_Conduct;
    int capacitys = capacity;
    logger.e(capacitys);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details'),
        backgroundColor: Color.fromARGB(255, 0, 149, 255),
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.withOpacity(
                      0.6), // Adjust the opacity and colors as needed
                  Colors.blue.withOpacity(0.3),
                ],
              ),
            ),
            child: SvgPicture.asset(
              'assets/passenger.svg',
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            child: Center(
              child: Text(
                'Remaining Passengers: $capacitys',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Over Crouded',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blue,
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                ),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          // Add more details as needed with appropriate styles
        ],
      ),
    );
  }
}
