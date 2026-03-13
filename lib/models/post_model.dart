import 'user_model.dart';

class PostModel {
  const PostModel({
    required this.id,
    required this.user,
    required this.mediaUrls,
    required this.caption,
    required this.likesCount,
    this.isLiked = false,
    this.isSaved = false,
    this.currentMediaIndex = 0,
  });

  final String id;
  final UserModel user;
  final List<String> mediaUrls;
  final String caption;
  final int likesCount;
  final bool isLiked;
  final bool isSaved;
  final int currentMediaIndex;

  bool get isCarousel => mediaUrls.length > 1;

  PostModel copyWith({
    String? id,
    UserModel? user,
    List<String>? mediaUrls,
    String? caption,
    int? likesCount,
    bool? isLiked,
    bool? isSaved,
    int? currentMediaIndex,
  }) {
    return PostModel(
      id: id ?? this.id,
      user: user ?? this.user,
      mediaUrls: mediaUrls ?? this.mediaUrls,
      caption: caption ?? this.caption,
      likesCount: likesCount ?? this.likesCount,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
      currentMediaIndex: currentMediaIndex ?? this.currentMediaIndex,
    );
  }
}