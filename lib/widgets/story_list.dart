import 'package:flutter/material.dart';

import '../models/app_constants.dart';
import '../models/user_model.dart';
import 'story_item.dart';

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
    required this.stories,
  });

  final List<UserModel> stories;

  @override
  Widget build(BuildContext context) {
    if (stories.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 114,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.horizontalPadding,
          vertical: 7,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return StoryItem(
              user: const UserModel(
                id: 'me',
                username: 'you',
                avatarUrl: AppConstants.currentUserAvatarUrl,
              ),
              isOwnStory: true,
            );
          }
          return StoryItem(user: stories[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 12),
        itemCount: stories.length,
      ),
    );
  }
}