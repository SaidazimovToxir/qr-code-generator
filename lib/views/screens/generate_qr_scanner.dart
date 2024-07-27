// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:qr_scanner_app/utils/app_theme.dart';

import '../widgets/generate_qr_category.dart';

class GenerateQrScanner extends StatelessWidget {
  const GenerateQrScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Generate QR",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 22,
            letterSpacing: 2,
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: AppSize.defaultPadding,
              top: 5,
              bottom: 5,
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xff333333),
                borderRadius: BorderRadius.circular(
                  AppSize.defaultBorder,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff333333),
                    blurRadius: 5.0,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Image.asset('assets/icons/menu.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.defaultPadding,
          vertical: AppSize.defaultBorder + 30,
        ),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 35,
          mainAxisSpacing: 35,
          children: [
            GenerateQrCategory(
              image: "qr",
              labelText: "Event",
              onPressed: () {},
            ),
            GenerateQrCategory(
              image: "web",
              labelText: "Webside",
              onPressed: () {},
            ),
            GenerateQrCategory(
              image: "qr",
              labelText: "Wi fi",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
