import 'package:flutter/material.dart';

class SteamColors {
  // Define the primary colors
  static const Color darkGrayishBlue =
      Color(0xFF171D25); // Main background color (dark)
  static const Color mediumBlue =
      Color(0xFF224787); // Main accent color (buttons, highlights)
  static const Color darkTeal =
      Color(0xFF184153); // Dark teal for secondary accents (header, borders)
  static const Color darkBlueGray =
      Color(0xFF1A2A3A); // Dark blue-gray for borders and dividers

  static const Color lightBlue = Color(0xFF4F6F93);
  static const Color lightTeal = Color(0xFF4D6F71);
  static const Color accentBlue = Color(0xFF3A5A7A);

  // Background colors
  static const Color lightBackground = Color(0xFFF0F0F0);
  static const Color darkBackground = Color(0xFF0D141B);
  static const Color sidebarBackground = darkGrayishBlue;

  static const Color bottomBarBackground = darkTeal;

  // Slideshow background color (can be a lighter or complementary background)
  static const Color slideshowBackground =
      lightBlue; // Lighter blue for slideshow background to highlight content

  // Text colors
  static const Color primaryText =
      Colors.white; // Primary text color (light text on dark background)
  static const Color secondaryText =
      Colors.black; // Secondary text color (dark text on light background)

  // Function to get all colors
  static List<Color> get allColors => [
        darkGrayishBlue,
        mediumBlue,
        darkTeal,
        darkBlueGray,
        lightBlue,
        lightTeal,
        accentBlue,
        lightBackground,
        darkBackground,
        sidebarBackground,
        bottomBarBackground,
        slideshowBackground,
        primaryText,
        secondaryText,
      ];

  // Example of using colors for UI elements
  static Color getTextColor(Color backgroundColor) {
    // Logic to determine appropriate text color based on background color
    if (backgroundColor == darkBackground ||
        backgroundColor == darkGrayishBlue) {
      return primaryText; // Light text for dark backgrounds
    } else {
      return secondaryText; // Dark text for light backgrounds
    }
  }
}
