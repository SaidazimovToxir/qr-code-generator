import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_app/views/widgets/camera_size.dart';
import 'package:qr_scanner_app/controllers/qr_controller.dart';

import '../widgets/scanner_line.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QRController controller = Get.put(QRController());

    return Obx(() {
      return Stack(
        children: [
          QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: const Color(0xffFDB623),
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: controller.cutOutSize.value,
            ),
          ),
          ResizableOverlay(
            initialSize: controller.cutOutSize.value,
            onSizeChanged: (newSize) {
              controller.updateCutOutSize(newSize);
            },
          ),
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff414140),
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
                color: const Color(0xff414140),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons/gallery_icon.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.toggleFlash();
                      },
                      child: const Icon(
                        Icons.flash_on,
                        color: Color(0xffD9D9D9),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.flipCamera();
                      },
                      child: const Icon(
                        Icons.flip_camera_ios_rounded,
                        color: Color(0xffD9D9D9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 400,
          //   left: 150,
          //   right: 150,
          //   child: ScannerLine(
          //     height: controller.cutOutSize.value,
          //   ),
          // ),
        ],
      );
    });
  }
}
