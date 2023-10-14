import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImage extends StatelessWidget {
  const QRImage({super.key, required this.controller});

  final String controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My QR Code'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 149, 255),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Scan this QR code to pay',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 150,
          ),
          Center(
            child: QrImageView(
              data: controller,
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
