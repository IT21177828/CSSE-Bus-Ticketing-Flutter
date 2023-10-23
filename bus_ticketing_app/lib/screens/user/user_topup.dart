import 'package:bus_ticketing_app/screens/user/checkout.dart';
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
  // TextEditingController CardNumberController = TextEditingController();
  // TextEditingController CardHolderNameController = TextEditingController();
  // TextEditingController ExpireDateController = TextEditingController();
  // TextEditingController CvvController = TextEditingController();
  final Map<String, String> headers = {
    'Content-Type': 'application/json', // Adjust the content type as needed
  };

  void topUp() async {
    
    String amountText = amountController.text;
    double prices = double.parse(amountText);
    double price =prices;
    // logger.e(amountText);
    String uID = NewUser.userID.toString();

    try {
      price = double.parse(amountText);
    } catch (e) {
      price = 0.0;
    }

    // logger.e(uID);
    // logger.e(price);

    final response = await http.post(
      Uri.parse('http://192.168.8.101:5050/transaction/topUpUserAccount/'),
      headers: headers,
      body: jsonEncode({
        'userID': '652939bd9215d4fb137705b1',
        'amount': price,
      }),
    );
logger.e("hay I am in");
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
        backgroundColor: Colors.blue,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
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
            padding: const EdgeInsets.only(left: 60),
            margin: EdgeInsets.only(left: 30, right: 30),
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
                    border: InputBorder.none,
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  topUp();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  UserCheckout(
         user_Qr: user_Qr, 
        newUser: NewUser,
                      ),
                    ),
                  );
                },
                child: const Text('Checkout'),
              ),
            ),
          ),
        ]
            // child: const Text('Wallet'),
            ),
      ),
    );
  }
}
