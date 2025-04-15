import 'package:flutter/material.dart';

/// This class provides placeholder implementations for images until real assets are available
class ImageUtils {
  /// Returns a placeholder widget with a gradient and a centered icon
  static Widget getPlaceholder(String imageAssetPath) {
    // Extract the filename to determine the type of placeholder
    String filename = imageAssetPath.split('/').last;
    
    // Choose colors based on the filename
    List<Color> gradientColors = _getGradientColors(filename);
    IconData icon = _getIconForImage(filename);
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 40,
          color: Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }
  
  /// Returns a set of gradient colors based on the image name
  static List<Color> _getGradientColors(String filename) {
    if (filename.contains('quantum') || filename.contains('cosmic')) {
      // Space-themed gradients
      return [
        const Color(0xFF1A237E),
        const Color(0xFF4A148C),
      ];
    } else if (filename.contains('emotional') || filename.contains('heart')) {
      // Emotional-themed gradients
      return [
        const Color(0xFFD32F2F),
        const Color(0xFF7B1FA2),
      ];
    } else if (filename.contains('inner') || filename.contains('self')) {
      // Self-themed gradients
      return [
        const Color(0xFF00796B),
        const Color(0xFF006064),
      ];
    } else if (filename.contains('time') || filename.contains('clarity')) {
      // Clarity-themed gradients
      return [
        const Color(0xFF1565C0),
        const Color(0xFF0277BD),
      ];
    } else if (filename.contains('morning') || filename.contains('day')) {
      // Morning-themed gradients
      return [
        const Color(0xFFFFA000),
        const Color(0xFFF57C00),
      ];
    } else {
      // Default gradients
      return [
        const Color(0xFF455A64),
        const Color(0xFF263238),
      ];
    }
  }
  
  /// Returns an appropriate icon for the image based on its name
  static IconData _getIconForImage(String filename) {
    if (filename.contains('quantum') || filename.contains('cosmic')) {
      return Icons.auto_awesome;
    } else if (filename.contains('emotional') || filename.contains('heart')) {
      return Icons.favorite;
    } else if (filename.contains('inner') || filename.contains('mirror')) {
      return Icons.person;
    } else if (filename.contains('time') || filename.contains('clarity')) {
      return Icons.timelapse;
    } else if (filename.contains('morning') || filename.contains('day')) {
      return Icons.wb_sunny;
    } else if (filename.contains('career') || filename.contains('work')) {
      return Icons.work;
    } else if (filename.contains('dinner') || filename.contains('eating')) {
      return Icons.restaurant;
    } else if (filename.contains('date') || filename.contains('relation')) {
      return Icons.favorite_border;
    } else {
      return Icons.spa;
    }
  }
} 