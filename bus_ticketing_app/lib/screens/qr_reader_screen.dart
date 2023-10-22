import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerApp extends StatefulWidget {
  const BarcodeScannerApp({Key? key}) : super(key: key);
  @override
  _BarcodeScannerAppState createState() => _BarcodeScannerAppState();
}

class _BarcodeScannerAppState extends State<BarcodeScannerApp> {
  String _scanBarcode = "No data yet";

  Future scanBarcodeNormal() async {
    String barcodeScanRes;

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);
    print(barcodeScanRes);

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Barcode Scanner Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: scanBarcodeNormal,
                child: Text("Scan Barcode"),
              ),
              Text(
                'Scan Result: $_scanBarcode',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
