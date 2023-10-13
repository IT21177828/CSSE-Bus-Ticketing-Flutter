// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class QRImage extends StatelessWidget {
//   const QRImage(this.controller, {super.key});

//   final TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter + QR code'),
//         centerTitle: true,
//       ),

//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: QrImageView(
//               data: controller.text,
//               version: QrVersions.auto,
//               size: 280.0,
//               embeddedImageStyle: const QrEmbeddedImageStyle(
//                 size:  Size(
//                   100,
//                   100,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
