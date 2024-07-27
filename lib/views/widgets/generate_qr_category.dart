import 'package:flutter/material.dart';
import 'package:qr_scanner_app/utils/app_theme.dart';

class GenerateQrCategory extends StatelessWidget {
  final String image;
  final String labelText;
  final VoidCallback onPressed;
  const GenerateQrCategory({
    super.key,
    required this.image,
    required this.labelText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(27),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFDB623),
                  Color(0xff333333),
                ],
              ),
              borderRadius: BorderRadius.circular(AppSize.defaultBorder),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(4, 4),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(-4, -4),
                ),
              ],
            ),
            child: Image.asset(
              'assets/icons/qr.png',
              width: 35,
              height: 35,
            ),
          ),
          Positioned(
            top: 2,
            left: 2,
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFF3C3C3C),
                borderRadius: BorderRadius.circular(AppSize.defaultBorder),
              ),
              child: Image.asset(
                'assets/icons/$image.png',
                width: 35,
                height: 35,
              ),
            ),
          ),
          Positioned(
            bottom: 18,
            left: 10,
            right: 35,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff333333),
                    Color(0xffFDB623),
                  ],
                ),
                borderRadius: BorderRadius.circular(AppSize.defaultBorder - 4),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                child: Text(
                  labelText,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
