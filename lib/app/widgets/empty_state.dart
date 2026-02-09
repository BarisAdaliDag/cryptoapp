import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../const/app_color.dart';
import '../const/app_typo.dart';
import '../const/app_string.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final IconData? icon;

  const EmptyState({super.key, this.message = AppStrings.noResultsFound, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon ?? Icons.search_off, size: 64, color: AppColors.secondaryText),
          const Gap(16),
          Text(message, style: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText)),
        ],
      ),
    );
  }
}
