import 'package:check_store/common/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerVM extends ChangeNotifier {
  Barcode? result;
  QRViewController? controller;
  dynamic value;

  Future<void> onQRViewCreated(QRViewController controller,BuildContext context)async{
    this.controller = controller;
    this.controller!.resumeCamera();
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      notifyListeners();
      if(result != null){
        Navigator.of(context).pushReplacementNamed(AppRouteName.CHECK_PAGE,arguments: result!.code);
        this.controller?.dispose();
      }
    });
  }
}
