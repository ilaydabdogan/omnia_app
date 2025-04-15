import 'package:flutter/material.dart';
import 'dart:io';
import '../models/omni.dart';
import '../theme/app_theme.dart';
import '../utils/image_utils.dart';

class FeaturedOmniHeader extends StatefulWidget {
  final List<Omni> omnis;
  final Function(Omni)? onOmniTap;

  const FeaturedOmniHeader({
    super.key,
    required this.omnis,
    this.onOmniTap,
  });

  @override
  State<FeaturedOmniHeader> createState() => _FeaturedOmniHeaderState();
}

class _FeaturedOmniHeaderState extends State<FeaturedOmniHeader> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Featured Omnis carousel
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.omnis.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final omni = widget.omnis[index];
              return FeaturedOmniCard(
                omni: omni,
                onTap: widget.onOmniTap != null ? () => widget.onOmniTap!(omni) : null,
              );
            },
          ),
        ),
        
        // Page indicator dots
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.omnis.length, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index 
                    ? AppTheme.primaryColor 
                    : AppTheme.subtitleColor.withOpacity(0.3),
              ),
            );
          }),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class FeaturedOmniCard extends StatelessWidget {
  final Omni omni;
  final VoidCallback? onTap;

  const FeaturedOmniCard({
    super.key,
    required this.omni,
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
        margin: const EdgeInsets.symmetric(horizontal: 8),
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
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: _buildBackgroundImage(),
              ),
            ),
            // Small suit label at the top
            Positioned(
              top: 16,
              left: 16,
              child: Text(
                omni.suit,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.5,
                  shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Colors.black45,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
            // Tag (if any)
            if (omni.tag != null)
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: _getTagColor(omni.tag),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    omni.tag!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
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
                    Colors.black.withOpacity(0.8),
                  ],
                  stops: const [0.0, 0.6, 0.8, 1.0],
                ),
              ),
            ),
            // Content at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title with emoji if applicable
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            omni.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: -0.5,
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black45,
                                  offset: Offset(0, 1),
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
                            style: const TextStyle(fontSize: 20),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Subtitle
                    Text(
                      omni.subtitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: -0.5,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black45,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
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
      );
    } else {
      // If file doesn't exist, use a placeholder
      return ImageUtils.getPlaceholder(omni.imageUrl);
    }
  }
} 