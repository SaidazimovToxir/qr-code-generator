import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var cutOutSize = 200.0.obs;
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      // qr yaratilgandan keyin
      print("Ushbu data qr code natijasi: $scanData");
    });
  }

  void toggleFlash() {
    controller?.toggleFlash();
  }

  void flipCamera() {
    controller?.flipCamera();
  }

  void updateCutOutSize(double newSize) {
    cutOutSize.value = newSize;
  }

  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) {
      controller?.resumeCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
