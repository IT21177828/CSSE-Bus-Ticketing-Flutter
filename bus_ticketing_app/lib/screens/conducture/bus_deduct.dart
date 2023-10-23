import 'dart:convert';

import 'package:bus_ticketing_app/screens/conducture/payment_list_item.dart';
import 'package:bus_ticketing_app/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticketing_app/screens/login_screen.dart';

import 'package:http/http.dart' as http;

class BusDeduct extends StatefulWidget {
  final String qrCode;
  final UserType conductor_Object;

  BusDeduct({required this.qrCode, required this.conductor_Object});

  @override
  _UserWalletState createState() => _UserWalletState(qrCode, conductor_Object);
}


class _UserWalletState extends State<BusDeduct> {


  late final String qrCode;
  late UserType conductor_Object;

  _UserWalletState(this.qrCode, this.conductor_Object);

    void initState() {
      getUserDetails();
    conductor_Object = widget.conductor_Object;

    String fName = conductor_Object.firstName;
    String userID = conductor_Object.userID;
    String lName = conductor_Object.lastName;
    String email = conductor_Object.emails;
    String gender = conductor_Object.gender;
    int age = conductor_Object.age;
    String address = conductor_Object.address;
    super.initState();
  }


Future getUserDetails() async {

      final Map<String, String> headers = {
      'Content-Type': 'application/json', // Adjust the content type as needed
    };

        final response = await http.post(
      Uri.parse('http://192.168.8.101:5050/users/userDetailsByQr'),
      headers: headers,
      body: jsonEncode({
        // 'userID': qrCode,
         "qrCode": "652953293a520e915fcf75f3",
      }),

      
    );

    final decodeData = json.decode(response.body);

    String firstName = decodeData['user']['firstName'];
    String lastName = decodeData['user']['lastName'];
    String accountBalance = decodeData['user']['accountBalance'];



    logger.e(decodeData);


}

  Future placeTicket() async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Adjust the content type as needed
    };

    final response = await http.post(
      Uri.parse('http://192.168.8.102:5050/transaction/deductBusFare'),
      headers: headers,
      body: jsonEncode({
        'userID': "652939bd9215d4fb137705b1",
        'amount': 100.00,
      }),
    );
  }


  @override
  Widget build(BuildContext context) {

    logger.e(conductor_Object);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Bus Deduct'),
          elevation: 1,
        ),
        body: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            children: [
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
                padding: const EdgeInsets.all(20),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Name:' ,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Bathiya Max',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Balance:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '\$21000109.00',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Bus Num:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'ND-8759',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Capacity:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '54',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Route:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '\Malabe to Colombo',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Price:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 62, 170),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '\$1000.00',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              ElevatedButton(
                onPressed: () {
                  placeTicket();
                },
                child: const Text(
                  'Deduct',
                  style: TextStyle(fontSize: 24),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                ),
              )
            ],
          ),
        ));
  }
}
