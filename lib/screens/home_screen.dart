import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_constants.dart';
import '../providers/post_provider.dart';
import '../widgets/instagram_svg_icon.dart';
import '../widgets/instagram_bottom_navigation.dart';
import '../widgets/post_card.dart';
import '../widgets/shimmer_loader.dart';
import '../widgets/story_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostProvider>().loadInitialData();
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }

    if (_scrollController.position.extentAfter < 1400) {
      context.read<PostProvider>().loadMorePosts();
    }
  }

  void _showComingSoonSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text(AppConstants.comingSoonMessage),
          duration: Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instagramDarkSurface,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: SafeArea(
          bottom: false,
          child: Container(
            height: 56,
            color: AppColors.instagramDarkSurface,
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.horizontalPadding),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 92,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => _showComingSoonSnackbar(context),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                            icon: const InstagramSvgIcon(
                              type: InstagramIconType.plus,
                              color: Colors.white,
                              size: AppDimens.topIconSize,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 92,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            IconButton(
                              onPressed: () => _showComingSoonSnackbar(context),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const InstagramSvgIcon(
                                type: InstagramIconType.heart,
                                color: Colors.white,
                                size: AppDimens.topIconSize,
                              ),
                            ),
                            Positioned(
                              right: -1,
                              top: -1,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF3040),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.instagramDarkSurface,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const IgnorePointer(
                  child: Text(
                    'Instagram',
                    style: TextStyle(
                      fontFamily: 'Billabong',
                      fontFamilyFallback: <String>['cursive'],
                      color: Colors.white,
                      fontSize: 41,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<PostProvider>(
        builder: (BuildContext context, PostProvider provider, _) {
          if (provider.isInitialLoading) {
            return const FeedShimmerLoader();
          }

          return RefreshIndicator(
            onRefresh: provider.refreshFeed,
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: provider.posts.length + 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Column(
                    children: <Widget>[
                      StoryList(stories: provider.stories),
                      const Divider(height: 1, color: Color(0xFF1E1E1E)),
                    ],
                  );
                }

                if (index == provider.posts.length + 1) {
                  if (!provider.isLoadingMore) {
                    return const SizedBox(height: 16);
                  }
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 22),
                    child: PostCardShimmer(),
                  );
                }

                final post = provider.posts[index - 1];
                return PostCard(
                  key: ValueKey<String>(post.id),
                  post: post,
                  onLike: () => provider.toggleLike(post.id),
                  onSave: () => provider.toggleSave(post.id),
                  onComment: () => _showComingSoonSnackbar(context),
                  onShare: () => _showComingSoonSnackbar(context),
                  onMediaChanged: (int mediaIndex) {
                    provider.setCarouselIndex(postId: post.id, index: mediaIndex);
                  },
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: InstagramBottomNavigation(
        currentIndex: _selectedTab,
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
          if (index != 0) {
            _showComingSoonSnackbar(context);
          }
        },
      ),
    );
  }
}