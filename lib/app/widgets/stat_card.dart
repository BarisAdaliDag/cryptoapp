import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../const/app_color.dart';
import '../const/app_typo.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Widget? icon;

  const StatCard({super.key, required this.label, required this.value, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.input.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, const Gap(8)],
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(color: AppColors.secondaryText, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(4),
          Text(
            value,
            style: AppTypography.bodyLarge.copyWith(color: AppColors.primaryText, fontWeight: FontWeight.w700),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
