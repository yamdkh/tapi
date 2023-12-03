import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/most_popular_post_model.dart';
import '../repository/most_post_repo.dart';

class PostCubit extends Cubit<MostPostPopular?> {
  PostRepository postRepository;

  PostCubit(this.postRepository) : super(null);

  void loadPosts() {
    postRepository.getMostPost().then((value) {
      emit(value);
    });
  }

  void refresh() {
    emit(null);
    loadPosts();
  }
}
