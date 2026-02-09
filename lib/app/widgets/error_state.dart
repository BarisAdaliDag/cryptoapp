import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../const/app_color.dart';
import '../const/app_string.dart';
import '../const/app_typo.dart';
import '../extension/padding_extension.dart';
import 'app_button.dart';

class ErrorState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onRetry;
  final IconData? icon;

  const ErrorState({super.key, this.title = AppStrings.failedToLoadData, this.subtitle, this.onRetry, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon ?? Icons.error_outline, size: 64, color: AppColors.secondaryText),
          const Gap(16),
          Text(
            title,
            style: AppTypography.headlineSmall.copyWith(color: AppColors.primaryText),
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            const Gap(8),
            Text(
              subtitle!,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText),
              textAlign: TextAlign.center,
            ),
          ],
          if (onRetry != null) ...[
            const Gap(24),
            AppButton(
              text: AppStrings.retry,
              icon: Icons.refresh,
              onPressed: onRetry,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ],
        ],
      ).allPadding(24),
    );
  }
}
