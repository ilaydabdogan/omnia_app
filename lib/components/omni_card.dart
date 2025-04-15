import 'package:flutter/material.dart';
import 'dart:io';
import '../models/omni.dart';
import '../theme/app_theme.dart';
import '../utils/image_utils.dart';

class OmniCard extends StatelessWidget {
  final Omni omni;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const OmniCard({
    super.key,
    required this.omni,
    this.width = 160.0,
    this.height = 200.0,
    this.onTap,
  });

  // Helper to determine the tag background color
  Color _getTagColor(String? tag) {
    if (tag == 'New') {
      return const Color(0xFF4CAF50); // Green for new
    } else if (tag == 'Popular') {
      return const Color(0xFF2196F3); // Blue for popular
    } else {
      return Colors.black54; // Default
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Image background with placeholder fallback
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: _buildBackgroundImage(),
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.7),
                  ],
                  stops: const [0.0, 0.6, 0.8, 1.0],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag (if any)
                  if (omni.tag != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: _getTagColor(omni.tag),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        omni.tag!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  const Spacer(),
                  // Title with emoji if applicable
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          omni.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: -0.2,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (omni.emoji != null)
                        Text(
                          omni.emoji!,
                          style: const TextStyle(fontSize: 16),
                        ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  // Subtitle
                  Text(
                    omni.subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.85),
                      letterSpacing: -0.1,
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Series indicator if applicable
                  if (omni.isSeries && omni.seriesCount != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        children: [
                          Text(
                            '${omni.seriesCount} experiences',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            size: 11,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build the background image with placeholder fallback
  Widget _buildBackgroundImage() {
    // Check if the image file exists
    final file = File(omni.imageUrl);
    if (file.existsSync()) {
      return Image.asset(
        omni.imageUrl,
        fit: BoxFit.cover,
        width: width,
        height: height,
      );
    } else {
      // If file doesn't exist, use a placeholder
      return SizedBox(
        width: width,
        height: height,
        child: ImageUtils.getPlaceholder(omni.imageUrl),
      );
    }
  }
} 