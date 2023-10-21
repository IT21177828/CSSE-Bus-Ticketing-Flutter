import 'package:flutter/material.dart';
import 'package:bus_ticketing_app/widgets/qr_image.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:bus_ticketing_app/screens/login_screen.dart';

class QRScreen extends StatefulWidget {
  // const QRScreen({super.key});
  // ignore: non_constant_identifier_names
  final String user_id;
  QRScreen({required this.user_id});

  @override
  // ignore: no_logic_in_create_state
  GenerateQRCodeState createState() => GenerateQRCodeState(user_id);
}

class GenerateQRCodeState extends State<QRScreen> {
  // ignore: non_constant_identifier_names
  final String user_id;

  GenerateQRCodeState(this.user_id);

  TextEditingController controller = TextEditingController();

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
              data: user_id,
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
