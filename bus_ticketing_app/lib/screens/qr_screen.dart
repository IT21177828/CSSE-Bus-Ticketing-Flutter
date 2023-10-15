import 'package:bus_ticketing_app/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticketing_app/widgets/qr_image.dart';
import 'package:logger/logger.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:bus_ticketing_app/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class QRScreen extends StatefulWidget {
  // const QRScreen({super.key});
  // ignore: non_constant_identifier_names
  final String user_Qr;
  // final String user_Id;
  QRScreen({required this.user_Qr});

  @override
  // ignore: no_logic_in_create_state
  GenerateQRCodeState createState() => GenerateQRCodeState(user_Qr);

  
}



class GenerateQRCodeState extends State<QRScreen> {
  // ignore: non_constant_identifier_names
  final String user_Qr;
  // final String user_Id;

  GenerateQRCodeState(this.user_Qr);

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // print("User ID: $user_Qr");
    fetchData(); // Call a separate method for fetching data
  }

  Future<void> fetchData() async {
    final String user = user_Qr;
    print("aaaaaa");
    print("User ID: $user_Qr");
    print("aaaaaa");

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

    final userQr = decodeData['qrCode'];
    final userAccoutBalance = decodeData['accountBalance'];
    final userFName = decodeData['firstName'];
    final userLName = decodeData['lastName'];
    final userEmail = decodeData['email'];
    final userGender = decodeData['gender'];
    final userAddress = decodeData['address'];

    logger.e(userQr);

  }
 
  




  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + QR code'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
          )
        ],
      ),
    );
  }
}
