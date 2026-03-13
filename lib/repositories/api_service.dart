import 'dart:math';

import '../models/app_constants.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';

class ApiService {
  static final List<UserModel> _users = <UserModel>[
    const UserModel(
      id: 'u1',
      username: 'aria.travels',
      avatarUrl:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=200&q=80',
    ),
    const UserModel(
      id: 'u2',
      username: 'noah.studio',
      avatarUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80',
    ),
    const UserModel(
      id: 'u3',
      username: 'liam.codes',
      avatarUrl:
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=200&q=80',
    ),
    const UserModel(
      id: 'u4',
      username: 'mia.frames',
      avatarUrl:
          'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?auto=format&fit=crop&w=200&q=80',
    ),
    const UserModel(
      id: 'u5',
      username: 'ethan.daily',
      avatarUrl:
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=200&q=80',
    ),
    const UserModel(
      id: 'u6',
      username: 'zoe.minimal',
      avatarUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80',
    ),
  ];

  static const List<String> _imagePool = <String>[
    'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1519817650390-64a93db51149?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1517336714739-489689fd1ca8?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1491553895911-0055eca6402d?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1520975922284-9f4a2f3ec82d?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1514996937319-344454492b37?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1465146344425-f00d5f5c8f07?auto=format&fit=crop&w=1400&q=80',
  ];

  static const List<String> _captions = <String>[
    'Golden hour and city noise.',
    'Moments that deserved a post.',
    'Weekend frames with a quiet mood.',
    'No filter, just this light.',
    'Small details, big memories.',
    'A calm day in a loud world.',
    'Postcard from today.',
    'Took this and smiled instantly.',
  ];

  Future<List<UserModel>> fetchStories() async {
    await Future.delayed(const Duration(milliseconds: 450));
    return _users;
  }

  Future<List<PostModel>> fetchPosts({required int page, required int limit}) async {
    await Future.delayed(AppConstants.apiDelay);
    final Random random = Random(page * 1000 + limit);
    final int start = page * limit;

    return List<PostModel>.generate(limit, (int index) {
      final int serial = start + index;
      final UserModel user = _users[serial % _users.length];
      final bool isCarousel = serial % 3 == 0;
      final int carouselLength = isCarousel ? (2 + serial % 3) : 1;
      final List<String> media = List<String>.generate(carouselLength, (int i) {
        return _imagePool[(serial + i) % _imagePool.length];
      });

      return PostModel(
        id: 'post_$serial',
        user: user,
        mediaUrls: media,
        caption: _captions[serial % _captions.length],
        likesCount: 112 + random.nextInt(5200),
      );
    });
  }
}
