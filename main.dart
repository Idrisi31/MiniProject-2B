import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRScannerPage(),
    );
  }
}

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
  setState(() {
    this.controller = controller;
  });
  controller.scannedDataStream.listen((scanData) {
    // Process the scanned data
    String date = scanData.code ?? ''; // Provide a default value if scanData.code is null

    // Mark attendance for the scanned date
    // For demonstration purposes, we print the scanned data
    print('Scanned date: $date');
  });
}


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
