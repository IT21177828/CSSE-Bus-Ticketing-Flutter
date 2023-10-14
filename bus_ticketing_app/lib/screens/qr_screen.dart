import 'package:flutter/material.dart';
import 'package:bus_ticketing_app/widgets/qr_image.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  GenerateQRCodeState createState() => GenerateQRCodeState();
}

class GenerateQRCodeState extends State<QRScreen> {
  TextEditingController controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My QR Code'),
        centerTitle: true,
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 0, 149, 255),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter your URL'),
            ),
          ),
          //This button when pressed navigates to QR code generation
          ElevatedButton(
              onPressed: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: ((context) {
                //       return QRImage(controller);
                //     }),
                //   ),
                // );
              },
              child: const Text('GENERATE QR CODE')),
        ],
      ),
    );
  }
}
