import '../models/app_constants.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';
import 'api_service.dart';

class PostRepository {
  PostRepository({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<List<PostModel>> getPosts({required int page}) {
    return _apiService.fetchPosts(page: page, limit: AppConstants.pageSize);
  }

  Future<List<UserModel>> getStories() {
    return _apiService.fetchStories();
  }
}