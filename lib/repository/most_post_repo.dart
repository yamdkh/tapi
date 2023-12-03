import '../api/new_york_api.dart';
import '../model/most_popular_post_model.dart';

enum AppMode { productions, development }

class PostRepository {
  MostPopularPost? mostPopularPost;

  PostRepository(
    AppMode appMode,
  ) {
    switch (appMode) {
      case AppMode.productions:
        mostPopularPost = ProductionMostPopularPost();
      case AppMode.development:
        mostPopularPost = MockMostPopularPost();
    }
  }

  Future<MostPostPopular?> getMostPost() async {
    await Future.delayed(Duration(milliseconds: 500));
    return mostPopularPost?.getMostPopularPost();
  }
}
