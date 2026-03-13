import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/app_constants.dart';
import '../models/user_model.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.user,
    this.isOwnStory = false,
  });

  final UserModel user;
  final bool isOwnStory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.storyAvatarOuter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                width: AppDimens.storyAvatarOuter,
                height: AppDimens.storyAvatarOuter,
                padding: const EdgeInsets.all(2.2),
                decoration: BoxDecoration(
                  gradient: isOwnStory
                      ? null
                      : const LinearGradient(
                          colors: AppColors.storyRingGradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                  color: isOwnStory ? const Color(0xFF2C2C2C) : null,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: AppColors.instagramDarkSurface,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: user.avatarUrl,
                      fit: BoxFit.cover,
                      width: AppDimens.storyImageSize,
                      height: AppDimens.storyImageSize,
                      placeholder: (BuildContext context, String url) => Container(
                        color: const Color(0xFF232323),
                      ),
                      errorWidget: (
                        BuildContext context,
                        String url,
                        Object error,
                      ) => Container(
                        color: const Color(0xFF232323),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.person,
                          size: 24,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (isOwnStory)
                Positioned(
                  right: -1,
                  bottom: -1,
                  child: Container(
                    width: 23,
                    height: 23,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11.5),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.instagramBlue,
                        borderRadius: BorderRadius.circular(9.5),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            isOwnStory ? 'Your story' : user.username,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}