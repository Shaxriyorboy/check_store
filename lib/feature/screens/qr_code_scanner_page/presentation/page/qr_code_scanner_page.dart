import 'dart:io';
import 'package:check_store/feature/screens/qr_code_scanner_page/view_model/qr_code_scanner_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

final qrCodeNotifier = ChangeNotifierProvider((ref) => QrCodeScannerVM());

class QrCodeScannerPage extends ConsumerStatefulWidget {
  const QrCodeScannerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<QrCodeScannerPage> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends ConsumerState<QrCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      ref.read(qrCodeNotifier).controller!.pauseCamera();
    } else if (Platform.isIOS) {
      ref.read(qrCodeNotifier).controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(qrCodeNotifier);
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qr code scanner"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (QRViewController controller){
                ref.read(qrCodeNotifier).onQRViewCreated(controller,context);
              },
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void deactivate() {
    ref.read(qrCodeNotifier).controller?.dispose();
    super.deactivate();
  }
}
