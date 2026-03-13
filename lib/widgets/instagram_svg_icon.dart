import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum InstagramIconType {
  plus,
  heart,
  heartFilled,
  comment,
  repost,
  send,
  save,
  saveFilled,
  home,
  homeFilled,
  reels,
  reelsFilled,
  search,
}

class InstagramSvgIcon extends StatelessWidget {
  const InstagramSvgIcon({
    super.key,
    required this.type,
    this.size = 24,
    this.color = Colors.white,
  });

  final InstagramIconType type;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      _svgFor(type, color),
      width: size,
      height: size,
    );
  }

  static String _svgFor(InstagramIconType type, Color color) {
    final String c = '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}';

    switch (type) {
      case InstagramIconType.plus:
        return '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 4.2V19.8M4.2 12H19.8" stroke="$c" stroke-width="1.95" stroke-linecap="round"/></svg>''';
      case InstagramIconType.heart:
        return '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 20.3C11.55 20.3 11.1 20.14 10.75 19.85L5.45 15.4C2.5 12.9 2.05 8.45 4.4 5.95C6.32 3.9 9.35 3.68 11.63 5.16L12 5.4L12.37 5.16C14.65 3.68 17.68 3.9 19.6 5.95C21.95 8.45 21.5 12.9 18.55 15.4L13.25 19.85C12.9 20.14 12.45 20.3 12 20.3Z" stroke="$c" stroke-width="1.9" stroke-linejoin="round"/></svg>''';
      case InstagramIconType.heartFilled:
        return '''<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M12 20.4C11.5 20.4 11 20.2 10.6 19.9L5.4 15.3C2.4 12.6 2 8.1 4.4 5.6C6.4 3.6 9.5 3.4 11.8 5L12 5.2L12.2 5C14.5 3.4 17.6 3.6 19.6 5.6C22 8.1 21.6 12.6 18.6 15.3L13.4 19.9C13 20.2 12.5 20.4 12 20.4Z" fill="$c"/></svg>''';
      case InstagramIconType.comment:
        return '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M20.8 11.5C20.8 15.8 16.95 19.3 12 19.3C10.74 19.3 9.57 19.06 8.52 18.59L4.25 19.75L5.41 15.68C4.54 14.42 4.05 12.99 4.05 11.5C4.05 7.2 7.9 3.7 12 3.7C16.95 3.7 20.8 7.2 20.8 11.5Z" stroke="$c" stroke-width="1.9" stroke-linejoin="round"/></svg>''';
      case InstagramIconType.repost:
        return '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M6.8 7.2H17.2L14.95 4.95" stroke="$c" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"/><path d="M17.2 16.8H6.8L9.05 19.05" stroke="$c" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"/></svg>''';
      case InstagramIconType.send:
        return '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M21 3L3.2 10L10.9 13.1L14 20.8L21 3Z" stroke="$c" stroke-width="1.9" stroke-linejoin="round"/></svg>''';
      case InstagramIconType.save:
        return '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M6.2 3.7H17.8C18.35 3.7 18.8 4.15 18.8 4.7V20L12 16.2L5.2 20V4.7C5.2 4.15 5.65 3.7 6.2 3.7Z" stroke="$c" stroke-width="1.9" stroke-linejoin="round"/></svg>''';
      case InstagramIconType.saveFilled:
        return '''<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M6 3.5H18C18.6 3.5 19 3.9 19 4.5V20L12 16.1L5 20V4.5C5 3.9 5.4 3.5 6 3.5Z" fill="$c"/></svg>''';
      case InstagramIconType.home:
        return '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4.2 10.35L12 4.3L19.8 10.35V19.8H4.2V10.35Z" stroke="$c" stroke-width="1.9" stroke-linejoin="round"/></svg>''';
      case InstagramIconType.homeFilled:
        return '''<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M4 10.2L12 4L20 10.2V20H4V10.2Z" fill="$c"/></svg>''';
      case InstagramIconType.reels:
        return '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="3.2" y="4.2" width="17.6" height="15.6" rx="2.8" stroke="$c" stroke-width="1.9"/><path d="M8 4.2L10.9 7.9" stroke="$c" stroke-width="1.9" stroke-linecap="round"/><path d="M13 4.2L15.9 7.9" stroke="$c" stroke-width="1.9" stroke-linecap="round"/><path d="M10.1 11.1L14.9 14L10.1 16.9V11.1Z" fill="$c"/></svg>''';
      case InstagramIconType.reelsFilled:
        return '''<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><rect x="3" y="4" width="18" height="16" rx="3" fill="$c"/><path d="M8 4L11 8" stroke="#000000" stroke-width="1.4" stroke-linecap="round"/><path d="M13 4L16 8" stroke="#000000" stroke-width="1.4" stroke-linecap="round"/><path d="M10 11L15 14L10 17V11Z" fill="#000000"/></svg>''';
      case InstagramIconType.search:
        return '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="10.8" cy="10.8" r="6.3" stroke="$c" stroke-width="1.9"/><path d="M15.7 15.7L20 20" stroke="$c" stroke-width="1.9" stroke-linecap="round"/></svg>''';
    }
  }
}
