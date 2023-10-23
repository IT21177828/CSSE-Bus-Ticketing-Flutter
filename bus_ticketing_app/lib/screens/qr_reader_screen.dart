import 'dart:convert';

import 'package:bus_ticketing_app/screens/conducture/bus_deduct.dart';
import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:bus_ticketing_app/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class BarcodeScannerApp extends StatefulWidget {
  final String user_ID_Conduct;
  final UserType newUser;

  // final String user_Id;
  const BarcodeScannerApp(
      {super.key, required this.user_ID_Conduct, required this.newUser});

  @override
  // ignore: no_logic_in_create_state
  _BarcodeScannerAppState createState() =>
      _BarcodeScannerAppState(user_ID_Conduct, newUser);
}

class _BarcodeScannerAppState extends State<BarcodeScannerApp> {
  String _scanBarcode = "No data yet";

  late final String user_Qr;
  late UserType NewUser;

  _BarcodeScannerAppState(this.user_Qr, this.NewUser);

  @override
  void initState() {
    NewUser = widget.newUser;

    String fName = NewUser.firstName;
    String userID = NewUser.userID;
    String lName = NewUser.lastName;
    String email = NewUser.emails;
    String gender = NewUser.gender;
    int age = NewUser.age;
    String address = NewUser.address;

    super.initState();
  }

  Future scanBarcodeNormal() async {
    String barcodeScanRes;

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);
    logger.e(barcodeScanRes);

    setState(() {
      _scanBarcode = barcodeScanRes;
    });

    String userID = NewUser.userID;

    String UID = "65294c9863497cad3070edd9";
    double price = 1000.00;

    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Adjust the content type as needed
    };

    final response = await http.post(
      Uri.parse('http://192.168.8.103:5050/transaction/deductBusFare'),
      headers: headers,
      body: jsonEncode({
        'userID': UID,
        'amount': 1000.00,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QR Scanner'),
          elevation: 1,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: scanBarcodeNormal,
                child: Text("Scan Barcode"),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 80,
                        right: 80,
                        top: 20,
                      ),
                      child: Text(
                        'Scan result',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        '$_scanBarcode\n',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // if (_scanBarcode != null &&
              //     _scanBarcode != "No data yet" &&
              //     _scanBarcode != "-1")
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusDeduct(qrCode: _scanBarcode, conductor_Object: NewUser),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 0, 67, 123)),
                      elevation: MaterialStateProperty.all<double>(0),
                    ),
                    child: const Text(
                      "Place Ticket",
                      style: TextStyle(fontSize: 20),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
