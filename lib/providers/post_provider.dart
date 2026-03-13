import 'package:flutter/foundation.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';
import '../repositories/post_repository.dart';

class PostProvider extends ChangeNotifier {
  PostProvider({PostRepository? repository}) : _repository = repository ?? PostRepository();

  final PostRepository _repository;

  final List<PostModel> _posts = <PostModel>[];
  final List<UserModel> _stories = <UserModel>[];

  bool _isInitialLoading = true;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _currentPage = 0;

  List<PostModel> get posts => List<PostModel>.unmodifiable(_posts);
  List<UserModel> get stories => List<UserModel>.unmodifiable(_stories);
  bool get isInitialLoading => _isInitialLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;

  Future<void> loadInitialData() async {
    if (!_isInitialLoading && _posts.isNotEmpty) {
      return;
    }

    _isInitialLoading = true;
    _hasMore = true;
    _currentPage = 0;
    _posts.clear();
    notifyListeners();

    try {
      final List<dynamic> data = await Future.wait<dynamic>(<Future<dynamic>>[
        _repository.getStories(),
        _repository.getPosts(page: _currentPage),
      ]);

      _stories
        ..clear()
        ..addAll(data[0] as List<UserModel>);
      _posts.addAll(data[1] as List<PostModel>);

      if ((data[1] as List<PostModel>).isEmpty) {
        _hasMore = false;
      }
      _currentPage = 1;
    } finally {
      _isInitialLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMorePosts() async {
    if (_isLoadingMore || !_hasMore || _isInitialLoading) {
      return;
    }

    _isLoadingMore = true;
    notifyListeners();

    try {
      final List<PostModel> newPosts = await _repository.getPosts(page: _currentPage);
      if (newPosts.isEmpty) {
        _hasMore = false;
      } else {
        _posts.addAll(newPosts);
        _currentPage++;
      }
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> refreshFeed() async {
    _isInitialLoading = true;
    notifyListeners();
    await loadInitialData();
  }

  void toggleLike(String postId) {
    final int index = _posts.indexWhere((PostModel post) => post.id == postId);
    if (index == -1) {
      return;
    }

    final PostModel target = _posts[index];
    final bool nowLiked = !target.isLiked;
    _posts[index] = target.copyWith(
      isLiked: nowLiked,
      likesCount: nowLiked ? target.likesCount + 1 : target.likesCount - 1,
    );
    notifyListeners();
  }

  void toggleSave(String postId) {
    final int index = _posts.indexWhere((PostModel post) => post.id == postId);
    if (index == -1) {
      return;
    }
    final PostModel target = _posts[index];
    _posts[index] = target.copyWith(isSaved: !target.isSaved);
    notifyListeners();
  }

  void setCarouselIndex({required String postId, required int index}) {
    final int postIndex = _posts.indexWhere((PostModel post) => post.id == postId);
    if (postIndex == -1) {
      return;
    }

    final PostModel target = _posts[postIndex];
    if (target.currentMediaIndex == index) {
      return;
    }

    _posts[postIndex] = target.copyWith(currentMediaIndex: index);
    notifyListeners();
  }
}