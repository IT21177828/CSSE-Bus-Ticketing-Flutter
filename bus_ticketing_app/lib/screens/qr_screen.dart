import 'package:bus_ticketing_app/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticketing_app/widgets/qr_image.dart';
import 'package:logger/logger.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QRScreen extends StatefulWidget {
  final String user_Qr;
  final UserType newUser;

  // final String user_Id;
  const QRScreen({required this.user_Qr, required this.newUser});

  @override
  // ignore: no_logic_in_create_state
  GenerateQRCodeState createState() => GenerateQRCodeState(user_Qr, newUser);
}

class GenerateQRCodeState extends State<QRScreen> {
  // ignore: non_constant_identifier_names
  final String user_Qr;

  UserType NewUser;

  GenerateQRCodeState(this.user_Qr, this.NewUser);

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    NewUser = widget.newUser;

    String balance = NewUser.accountBalance.toString();

    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final String user = user_Qr;

    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Adjust the content type as needed
    };

    print("User ID: $user_Qr");

    final response = await http.post(
      Uri.parse('http://192.168.8.100:5050/users/userData/'),
      headers: headers,
      body: jsonEncode({
        "_id": "652937a69604eb52db13a375",
      }),
    );
    final decodeData = json.decode(response.body);
  }

  Widget build(BuildContext context) {
    String user_Qr = NewUser.qrCode;
    int balance = NewUser.accountBalance;
    String fName = NewUser.firstName;
    String lName = NewUser.lastName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My QR Code'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hey $fName $lName",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Center(
            child: QrImageView(
              data: user_Qr,
              version: QrVersions.auto,
              size: 280.0,
              embeddedImageStyle: const QrEmbeddedImageStyle(
                size: Size(
                  100,
                  100,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            "Balance: $balance .00 LKR",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
