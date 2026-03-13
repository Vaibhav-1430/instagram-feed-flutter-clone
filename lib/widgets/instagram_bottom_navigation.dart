import 'package:flutter/material.dart';

import '../models/app_constants.dart';
import 'instagram_svg_icon.dart';

class InstagramBottomNavigation extends StatelessWidget {
  const InstagramBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.instagramDarkSurface,
        border: Border(
          top: BorderSide(color: Color(0xFF1E1E1E), width: 0.6),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.instagramDarkSurface,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: AppDimens.bottomNavIconSize,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: InstagramSvgIcon(
              type: InstagramIconType.home,
              size: AppDimens.bottomNavIconSize,
            ),
            activeIcon: InstagramSvgIcon(
              type: InstagramIconType.homeFilled,
              size: AppDimens.bottomNavIconSize,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InstagramSvgIcon(
              type: InstagramIconType.reels,
              size: AppDimens.bottomNavIconSize,
            ),
            activeIcon: InstagramSvgIcon(
              type: InstagramIconType.reelsFilled,
              size: AppDimens.bottomNavIconSize,
            ),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: _InboxTabIcon(),
            activeIcon: _InboxTabIcon(),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: InstagramSvgIcon(
              type: InstagramIconType.search,
              size: AppDimens.bottomNavIconSize,
            ),
            activeIcon: InstagramSvgIcon(
              type: InstagramIconType.search,
              size: AppDimens.bottomNavIconSize,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _ProfileTabIcon(isActive: false),
            activeIcon: _ProfileTabIcon(isActive: true),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _ProfileTabIcon extends StatelessWidget {
  const _ProfileTabIcon({required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isActive
                ? Border.all(color: Colors.white, width: 1.8)
                : Border.all(color: Colors.transparent, width: 1.8),
          ),
          child: const CircleAvatar(
            radius: 11,
            backgroundImage: NetworkImage(AppConstants.currentUserAvatarUrl),
          ),
        ),
        Positioned(
          right: -1,
          bottom: -1,
          child: Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: const Color(0xFFFF3040),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.instagramDarkSurface, width: 1.2),
            ),
          ),
        ),
      ],
    );
  }
}

class _InboxTabIcon extends StatelessWidget {
  const _InboxTabIcon();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        const InstagramSvgIcon(
          type: InstagramIconType.send,
          size: AppDimens.bottomNavIconSize,
          color: Colors.white,
        ),
        Positioned(
          right: -1,
          bottom: -1,
          child: Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: const Color(0xFFFF3040),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.instagramDarkSurface, width: 1.2),
            ),
          ),
        ),
      ],
    );
  }
}
