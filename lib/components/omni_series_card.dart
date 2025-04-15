import 'package:flutter/material.dart';
import 'dart:io';
import '../models/omni.dart';
import '../theme/app_theme.dart';
import '../utils/image_utils.dart';

class OmniSeriesCard extends StatelessWidget {
  final Omni series;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const OmniSeriesCard({
    super.key,
    required this.series,
    this.width = 280.0,
    this.height = 140.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image side
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: SizedBox(
                width: 110,
                height: double.infinity,
                child: _buildImage(),
              ),
            ),
            // Text content side
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Series count indicator
                        Text(
                          '${series.seriesCount} experiences',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Title
                        Text(
                          series.title,
                          style: AppTheme.cardTitleStyle.copyWith(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Subtitle
                        Text(
                          series.subtitle,
                          style: AppTheme.cardSubtitleStyle.copyWith(fontSize: 13),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        // Arrow indicator
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View Series',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppTheme.textColor.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 12,
                              color: AppTheme.textColor.withOpacity(0.7),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build the image or placeholder
  Widget _buildImage() {
    Widget imageWidget;
    
    // Check if the image file exists
    final file = File(series.imageUrl);
    if (file.existsSync()) {
      imageWidget = Image.asset(
        series.imageUrl,
        fit: BoxFit.cover,
        width: 110,
        height: double.infinity,
      );
    } else {
      // If file doesn't exist, use a placeholder
      imageWidget = ImageUtils.getPlaceholder(series.imageUrl);
    }
    
    // Stack for tag badge
    return Stack(
      children: [
        // Image or placeholder
        imageWidget,
        // Tag badge if exists
        if (series.tag != null)
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: series.tag == 'New'
                    ? const Color(0xFF4CAF50)
                    : const Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                series.tag!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
} 