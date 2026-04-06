import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class HeroImage extends StatelessWidget {
  final String imagePath;
  final String city;
  final String place;

  const HeroImage({
    super.key,
    required this.imagePath,
    required this.city,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          width: double.infinity,
          height: 220,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.imageOverlayDark,
                  AppColors.imageOverlayTransparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(city, style: AppTextStyles.imageCity),
              Text(place, style: AppTextStyles.imagePlace),
            ],
          ),
        ),
      ],
    );
  }
}
