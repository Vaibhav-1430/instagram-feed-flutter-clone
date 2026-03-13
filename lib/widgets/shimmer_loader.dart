import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/app_constants.dart';

class FeedShimmerLoader extends StatelessWidget {
  const FeedShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        const StoriesShimmer(),
        const Divider(height: 1, color: Color(0xFF1F1F1F)),
        ...List<Widget>.generate(3, (_) => const PostCardShimmer()),
      ],
    );
  }
}

class StoriesShimmer extends StatelessWidget {
  const StoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: Shimmer.fromColors(
        baseColor: const Color(0xFF1D1D1D),
        highlightColor: const Color(0xFF2B2B2B),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.horizontalPadding,
            vertical: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => Column(
            children: <Widget>[
              Container(
                width: 68,
                height: 68,
                decoration: const BoxDecoration(
                  color: Color(0xFF2B2B2B),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 58,
                height: 10,
                color: Color(0xFF2B2B2B),
              ),
            ],
          ),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
          itemCount: 6,
        ),
      ),
    );
  }
}

class PostCardShimmer extends StatelessWidget {
  const PostCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF1D1D1D),
      highlightColor: const Color(0xFF2B2B2B),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2B2B2B),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Container(width: 96, height: 10, color: Color(0xFF2B2B2B)),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(color: const Color(0xFF2B2B2B)),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: List<Widget>.generate(
                4,
                (_) => Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 20,
                    height: 20,
                    color: const Color(0xFF2B2B2B),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(width: 120, height: 10, color: const Color(0xFF2B2B2B)),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(width: 210, height: 10, color: const Color(0xFF2B2B2B)),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}