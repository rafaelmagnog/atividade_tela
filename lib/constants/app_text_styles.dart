import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle appBarTitle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle imageCity = TextStyle(
    color: AppColors.white,
    fontSize: 14,
  );

  static const TextStyle imagePlace = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle actionLabel = TextStyle(
    color: AppColors.primary,
    fontSize: 12,
  );

  static const TextStyle paragraph = TextStyle(fontSize: 14, height: 1.5);

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle filterLabel = TextStyle(
    color: AppColors.primary,
    fontSize: 14,
  );
}
