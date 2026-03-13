import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/app_constants.dart';
import '../models/post_model.dart';
import 'post_actions.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
    required this.onLike,
    required this.onSave,
    required this.onComment,
    required this.onShare,
    required this.onMediaChanged,
  });

  final PostModel post;
  final VoidCallback onLike;
  final VoidCallback onSave;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final ValueChanged<int> onMediaChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _PostHeader(post: post),
        _PostMedia(
          post: post,
          onMediaChanged: onMediaChanged,
        ),
        if (post.isCarousel)
          _CarouselIndicator(
            count: post.mediaUrls.length,
            currentIndex: post.currentMediaIndex,
          ),
        const SizedBox(height: 8),
        PostActions(
          isLiked: post.isLiked,
          isSaved: post.isSaved,
          onLike: onLike,
          onSave: onSave,
          onComment: onComment,
          onShare: onShare,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.horizontalPadding),
          child: Text(
            '${post.likesCount} likes',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13.5,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.horizontalPadding),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.white,
                height: 1.3,
                fontSize: 13.5,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${post.user.username} ',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: post.caption),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.postHeaderHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.horizontalPadding),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFF262626),
              backgroundImage: CachedNetworkImageProvider(post.user.avatarUrl),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    post.user.username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.music_note,
                        size: 12,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          '${post.user.username} - Original audio',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_vert, size: 20, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class _PostMedia extends StatefulWidget {
  const _PostMedia({
    required this.post,
    required this.onMediaChanged,
  });

  final PostModel post;
  final ValueChanged<int> onMediaChanged;

  @override
  State<_PostMedia> createState() => _PostMediaState();
}

class _PostMediaState extends State<_PostMedia> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.post.currentMediaIndex);
  }

  @override
  void didUpdateWidget(covariant _PostMedia oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.post.currentMediaIndex != widget.post.currentMediaIndex &&
        _pageController.hasClients) {
      _pageController.jumpToPage(widget.post.currentMediaIndex);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.post.isCarousel) {
      return AspectRatio(
        aspectRatio: 1,
        child: ZoomableNetworkImage(url: widget.post.mediaUrls.first),
      );
    }

    return AspectRatio(
      aspectRatio: 1,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.post.mediaUrls.length,
        onPageChanged: widget.onMediaChanged,
        itemBuilder: (BuildContext context, int index) {
          return ZoomableNetworkImage(url: widget.post.mediaUrls[index]);
        },
      ),
    );
  }
}

class _CarouselIndicator extends StatelessWidget {
  const _CarouselIndicator({
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          count,
          (int index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 6,
              height: 6,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? AppColors.instagramBlue
                    : const Color(0xFF8E8E8E),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ZoomableNetworkImage extends StatefulWidget {
  const ZoomableNetworkImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<ZoomableNetworkImage> createState() => _ZoomableNetworkImageState();
}

class _ZoomableNetworkImageState extends State<ZoomableNetworkImage>
    with SingleTickerProviderStateMixin {
  late final TransformationController _transformationController;
  late final AnimationController _resetController;
  Animation<Matrix4>? _matrixAnimation;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _resetController = AnimationController(
      duration: const Duration(milliseconds: 220),
      vsync: this,
    )
      ..addListener(() {
        if (_matrixAnimation != null) {
          _transformationController.value = _matrixAnimation!.value;
        }
      });
  }

  @override
  void dispose() {
    _resetController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  void _animateBackToDefault() {
    _matrixAnimation = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(
      CurvedAnimation(parent: _resetController, curve: Curves.easeOutCubic),
    );
    _resetController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: InteractiveViewer(
        minScale: 1,
        maxScale: 4,
        clipBehavior: Clip.none,
        transformationController: _transformationController,
        onInteractionEnd: (_) => _animateBackToDefault(),
        child: CachedNetworkImage(
          imageUrl: widget.url,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          placeholder: (BuildContext context, String url) {
            return Container(
              color: const Color(0xFF1E1E1E),
              alignment: Alignment.center,
              child: const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          },
          errorWidget: (BuildContext context, String url, Object error) {
            return Container(
              color: const Color(0xFF1E1E1E),
              alignment: Alignment.center,
              child: const Icon(
                Icons.broken_image_outlined,
                color: Colors.white38,
                size: 36,
              ),
            );
          },
        ),
      ),
    );
  }
}
