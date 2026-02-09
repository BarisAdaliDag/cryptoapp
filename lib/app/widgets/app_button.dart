import 'package:flutter/material.dart';
import '../const/app_color.dart';
import '../const/app_typo.dart';

enum ButtonVariant { primary, secondary }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final IconData? icon;
  final EdgeInsets? padding;
  final double? elevation;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.icon,
    this.padding,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = variant == ButtonVariant.primary ? AppColors.primary : AppColors.input;
    final foregroundColor = variant == ButtonVariant.primary ? Colors.white : AppColors.primaryText;

    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        style: _getButtonStyle(backgroundColor, foregroundColor),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: _getButtonStyle(backgroundColor, foregroundColor),
      child: Text(
        text,
        style: AppTypography.button.copyWith(color: foregroundColor, fontWeight: FontWeight.w700),
      ),
    );
  }

  ButtonStyle _getButtonStyle(Color backgroundColor, Color foregroundColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: elevation ?? (variant == ButtonVariant.primary ? 8 : 0),
      shadowColor: variant == ButtonVariant.primary ? AppColors.primary.withOpacity(0.3) : null,
    );
  }
}
