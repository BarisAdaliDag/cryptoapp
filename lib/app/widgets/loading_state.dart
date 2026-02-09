import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../const/app_color.dart';
import '../const/app_typo.dart';

class LoadingState extends StatelessWidget {
  final String? message;

  const LoadingState({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: AppColors.primary),
          if (message != null) ...[
            const Gap(16),
            Text(message!, style: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText)),
          ],
        ],
      ),
    );
  }
}
