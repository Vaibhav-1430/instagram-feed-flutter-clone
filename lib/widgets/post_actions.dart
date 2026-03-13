import 'package:flutter/material.dart';

import '../models/app_constants.dart';
import 'instagram_svg_icon.dart';

class PostActions extends StatelessWidget {
  const PostActions({
    super.key,
    required this.isLiked,
    required this.isSaved,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onSave,
  });

  final bool isLiked;
  final bool isSaved;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.horizontalPadding),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: onLike,
            splashRadius: 18,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: InstagramSvgIcon(
              type: isLiked ? InstagramIconType.heartFilled : InstagramIconType.heart,
              size: 26,
              color: isLiked ? Colors.red : Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: onComment,
            splashRadius: 18,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const InstagramSvgIcon(
              type: InstagramIconType.comment,
              size: 26,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: onShare,
            splashRadius: 18,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const InstagramSvgIcon(
              type: InstagramIconType.repost,
              size: 26,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: onShare,
            splashRadius: 18,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const InstagramSvgIcon(
              type: InstagramIconType.send,
              size: 26,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onSave,
            splashRadius: 18,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: InstagramSvgIcon(
              type: isSaved ? InstagramIconType.saveFilled : InstagramIconType.save,
              size: 26,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}