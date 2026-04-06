import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primary, size: 26),
            const SizedBox(height: 4),
            Text(label, style: AppTextStyles.actionLabel),
          ],
        ),
      ),
    );
  }
}

class StarsButton extends StatelessWidget {
  final String label;
  final int starCount;
  final VoidCallback? onTap;

  const StarsButton({
    super.key,
    required this.label,
    required this.starCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                starCount,
                (_) =>
                    const Icon(Icons.star, color: AppColors.primary, size: 22),
              ),
            ),
            const SizedBox(height: 4),
            Text(label, style: AppTextStyles.actionLabel),
          ],
        ),
      ),
    );
  }
}
