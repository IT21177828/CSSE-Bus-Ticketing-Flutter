import 'dart:convert';

import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:bus_ticketing_app/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserTopup extends StatefulWidget {
  final String user_Qr;
  final UserType newUser;

  const UserTopup({required this.user_Qr, required this.newUser});

  @override
  // ignore: no_logic_in_create_state
  _UserTopupState createState() => _UserTopupState(user_Qr, newUser);
}

class _UserTopupState extends State<UserTopup> {
  late final String user_Qr;
  late UserType NewUser;

  _UserTopupState(this.user_Qr, this.NewUser);

  @override
  void initState() {
    NewUser = widget.newUser;
    String uID = NewUser.userID.toString();
    super.initState();
  }

  TextEditingController amountController = TextEditingController();

  final Map<String, String> headers = {
    'Content-Type': 'application/json', // Adjust the content type as needed
  };

  void topUp() async {
    String amountText = amountController.text;
    double price;
    String uID = NewUser.userID.toString();

    try {
      price = double.parse(amountText);
    } catch (e) {
      // Handle parsing errors, e.g., when the input is not a valid double
      // You can set a default value or display an error message to the user
      price = 0.0;
      // Handle the error as needed
    }

    logger.e(price);

    final response = await http.post(
      Uri.parse('http://192.168.8.101:5050/qr/topUpUserAccount/'),
      headers: headers,
      body: jsonEncode({
        'userID': uID,
        'amount': price,
      }),
    );

    final newjsonResponse = json.decode(response.body);
    logger.e(newjsonResponse);
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String uID = NewUser.userID;
    return Scaffold(
      appBar: AppBar(
        title:
            Container(alignment: Alignment.center, child: const Text('Top Up')),
        backgroundColor: const Color.fromARGB(255, 51, 170, 255),
        elevation: 1,
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Top Up Amount',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'LKR',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: TextField(
                controller: amountController,
                style: const TextStyle(fontSize: 50),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '00.00',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
        const SizedBox(
          height: 80,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 200),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 51, 170, 255),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                topUp();
              },
              child: Text('Check Out'),
            ),
          ),
        ),
      ]
          // child: const Text('Wallet'),
          ),
    );
  }
}
