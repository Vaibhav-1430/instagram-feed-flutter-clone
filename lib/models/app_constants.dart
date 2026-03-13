import 'package:flutter/material.dart';

class AppConstants {
  static const String appTitle = 'Instagram Clone';
  static const int pageSize = 10;
  static const Duration apiDelay = Duration(milliseconds: 1500);
  static const String comingSoonMessage = 'Feature coming soon';
  static const String currentUserAvatarUrl =
      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=120&q=70';
}

class AppColors {
  static const Color instagramBlack = Color(0xFF0A0A0A);
  static const Color instagramDarkSurface = Color(0xFF000000);
  static const Color instagramBlue = Color(0xFF3797EF);
  static const Color lightGrey = Color(0xFFEDEDED);
  static const Color captionGrey = Color(0xFF8E8E8E);
  static const Color lightText = Color(0xFFF5F5F5);
  static const List<Color> storyRingGradient = <Color>[
    Color(0xFFD62976),
    Color(0xFFFA7E1E),
    Color(0xFFFEDA75),
  ];
}

class AppDimens {
  static const double horizontalPadding = 16;
  static const double postHeaderHeight = 56;
  static const double topIconSize = 26;
  static const double storyAvatarOuter = 70;
  static const double storyAvatarInner = 64;
  static const double storyImageSize = 60;
  static const double bottomNavIconSize = 28;
}
