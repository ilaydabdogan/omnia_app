import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onSeeMore;

  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 10, 12),
      child: Row(
        children: [
          // Title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textColor,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 2),
                // Subtitle
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.subtitleColor,
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),
          // See more button with chevron
          if (onSeeMore != null)
            IconButton(
              onPressed: onSeeMore,
              icon: const Icon(
                Icons.chevron_right,
                color: AppTheme.textColor,
                size: 26,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }
} 